//  SelectedTrackVC.swift
//  Zodio

import UIKit

class SelectedTrackVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var trackImg: UIImageView!
    @IBOutlet weak var trackTitle: UILabel!
    @IBOutlet weak var moreTunesBtn: UIButton!
    
    //A soundCloud track
    var soundCloudTrack: SoundCloudTrack!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if soundCloudTrack != nil {
            
            trackTitle.text = soundCloudTrack.trackName
            moreTunesBtn.setTitle("More Tracks from " + soundCloudTrack.username, for: .normal)
            
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
    
    @IBAction func moreTunesFromUser(_ sender: UIButton) {
        
    }

}
