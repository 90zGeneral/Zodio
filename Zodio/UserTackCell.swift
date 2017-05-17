//
//  UserTackCell.swift
//  Zodio
//
//  Created by Roydon Jeffrey on 4/7/17.
//  Copyright © 2017 Italyte. All rights reserved.
//

import UIKit

class UserTackCell: UITableViewCell {
    
    //Outlet
    @IBOutlet weak var userTrackTitle: UILabel!
    @IBOutlet weak var trackImg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //Cell configuration
    func configureUserCell(userTrack: SpotifyTrack) {
        
        //Assignment for cell content
        userTrackTitle.text = userTrack.trackName
        
        //String conversion to URL and function call to download the image if successful
        if let checkedUrl = URL(string: userTrack.trackImg) {
            trackImg.contentMode = .scaleAspectFit
            downloadImage(url: checkedUrl)
            
        }else {
            //Otherwise, use a default image
            trackImg.contentMode = .scaleAspectFit
            trackImg.image = UIImage(named: "smiley")
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
}
