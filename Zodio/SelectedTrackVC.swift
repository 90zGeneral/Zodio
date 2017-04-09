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
    
    //A soundCloud track
    var soundCloudTrack: SoundCloudTrack!
    var fetchData = FetchData()
    
    var player = AVPlayer()
    var playerItem: AVPlayerItem!
    var isMusicPlaying = false
    
    var userArray = ["water", "sand", "fire", "earth", "wind", "cloud", "trees"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerItem = AVPlayerItem(url: URL(string: soundCloudTrack.streamUrl + "?client_id=d6i0wruU7ddayTqrhwszluW0i9aNBlb1")!)
        player = AVPlayer(playerItem: playerItem)
        player.rate = 1.0
        player.play()
        isMusicPlaying = true
        
        if soundCloudTrack != nil {
            
            trackTitle.text = soundCloudTrack.trackName
            uploadedBy.text = "uploaded by " + soundCloudTrack.username.capitalized
            moreTunesBtn.setTitle("More Tracks from " + soundCloudTrack.username.capitalized, for: .normal)
            
            if let checkedUrl = URL(string: soundCloudTrack.trackImg) {
                trackImg.contentMode = .scaleAspectFit
                downloadImage(url: checkedUrl)
                
            }else {
                trackImg.contentMode = .scaleAspectFit
                trackImg.image = UIImage(named: "smiley")
            }
        }

    }
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
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
    
    @IBAction func moreTunesFromUser(_ sender: UIButton) {
        
        let rand = arc4random_uniform(6) + 1
        let convertRandToInt = Int(rand)
        
        userTracks.removeAll()
        
        updateURL(input: userArray[convertRandToInt])
        
        performSegue(withIdentifier: "UserTableVC", sender: soundCloudTrack)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? UsernameTableVC {
            if let chosenTrack = sender as? SoundCloudTrack {
                destination.userSoundCloudTrack = chosenTrack
            }
        }
    }

}
