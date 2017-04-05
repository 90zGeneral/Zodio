//
//  MainVC.swift
//  Zodio
//
//  Created by Roydon Jeffrey on 4/4/17.
//  Copyright © 2017 Italyte. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    //Outlet
    @IBOutlet weak var zodiacSearch: UITextField!
    
    var soundCloudTrack: SoundCloudTrack!
    let dictObject: [String: Any] = ["title": "Life Sweet", "username": "Vybz Kartel"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        soundCloudTrack = SoundCloudTrack(object: dictObject)

    }
    
    @IBAction func search(_ sender: UIButton) {
        //Make sure the search bar is not empty
        if zodiacSearch.text != nil || zodiacSearch.text != "" || zodiacSearch.text != " " {
            
            //Assign the search bar text to userInput
            userInput = zodiacSearch.text
            
            //Empty out the textField
            zodiacSearch.text = ""
            
            //
            soundCloudTrack.downloadSoundCloudTrackDetails {
                
                //
                print(tracks.count)
                
            }
        }
        
        zodiacSearch.resignFirstResponder()
    }

}
