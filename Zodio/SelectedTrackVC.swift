//  SelectedTrackVC.swift
//  Zodio

import UIKit
import AVFoundation

class SelectedTrackVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var trackImg: UIImageView!
    @IBOutlet weak var trackTitle: UILabel!
    @IBOutlet weak var uploadedBy: UILabel!
    @IBOutlet weak var moreTunesBtn: UIButton!
    @IBOutlet weak var musicBtnImg: UIButton!
    
    //A spotify track
    var spotifyTrack: SpotifyTrack!
    var fetchData = FetchData()
    
    //Declaration of an AVPlayer, its Item, and current play state
    var player = AVPlayer()
    var playerItem: AVPlayerItem!
    var isMusicPlaying = false
    
    //These elements will be used as parameters in the network call to see more tracks by a specific user
    var userArray = ["water", "sand", "fire", "earth", "wind", "cloud", "trees"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //String conversion to URL to stream the music, add item to AVPlayer, set the rate of the player, and change the play state
        playerItem = AVPlayerItem(url: URL(string: spotifyTrack.streamUrl + "?client_id=d6i0wruU7ddayTqrhwszluW0i9aNBlb1")!)
        player = AVPlayer(playerItem: playerItem)
        player.rate = 1.0
        player.play()
        isMusicPlaying = true
        
        if spotifyTrack != nil {
            
            //Outlet assignments
            trackTitle.text = spotifyTrack.trackName
            uploadedBy.text = "uploaded by " + spotifyTrack.artist.capitalized
            moreTunesBtn.setTitle("More Tracks from " + spotifyTrack.artist.capitalized, for: .normal)
            
            //String conversion to URL and function call to download the image if successful
            if let checkedUrl = URL(string: spotifyTrack.trackImg) {
                trackImg.contentMode = .scaleAspectFit
                downloadImage(url: checkedUrl)
                
            }else {
                //Otherwise, use a default image
                trackImg.contentMode = .scaleAspectFit
                trackImg.image = UIImage(named: "smiley")
            }
        }

    }
    
    //To get the data from the URL
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    //To download a track image
    func downloadImage(url: URL) {
        print("Download Started")
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            print("Download Finished")
            DispatchQueue.main.async() { () -> Void in
                self.trackImg.image = UIImage(data: data)
            }
        }
    }
    
    //To control the playing state of the track
    @IBAction func musicBtn(_ sender: UIButton) {
        if isMusicPlaying {
            player.pause()
            musicBtnImg.setImage(UIImage(named: "orangePlayBtn"), for: .normal)
            isMusicPlaying = false
            
        }else {
            player.play()
            musicBtnImg.setImage(UIImage(named: "orangeStopBtn"), for: .normal)
            isMusicPlaying = true
            
        }
    }
    
    //View more tracks from the user
    @IBAction func moreTunesFromUser(_ sender: UIButton) {
        
        //Random number generator
        let rand = arc4random_uniform(6) + 1
        let convertRandToInt = Int(rand)
        
        //Empty out the array
        userTracks.removeAll()
        
        //Function call to update the url components for the network call 
        updateURL(input: userArray[convertRandToInt])
        
        //Perform segue
        performSegue(withIdentifier: "UserTableVC", sender: spotifyTrack)
        
    }
    
    //Prepare for the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? UsernameTableVC {
            if let chosenTrack = sender as? SpotifyTrack {
                destination.userSpotifyTrack = chosenTrack
            }
        }
    }

}
