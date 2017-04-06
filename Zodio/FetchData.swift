//
//  FetchData.swift
//  Zodio
//
//  Created by Roydon Jeffrey on 4/5/17.
//  Copyright © 2017 Italyte. All rights reserved.
//

import Foundation
import Alamofire

class FetchData {
    
    //To make the network call to the api
    func downloadSoundCloudTrackDetails(completed: @escaping DownloadComplete) {
        
        let theFullUrl = URL(string: completeUrl)!
        
        //GET request
        Alamofire.request(theFullUrl).responseJSON { (response) in
            
            //To store the results being returned as an array of dictionaries
            if let arrayOfDicts = response.result.value! as? [[String: Any]] {
                
                //Loop over the array
                for eachTrackDict in arrayOfDicts {
                    
                    //New Instance for each dictionary in the array
                    let newSoundCloudTrack = SoundCloudTrack(trackDict: eachTrackDict)
                    
                    //Limit the array to 5 tracks at a time
                    if tracks.count < 11 {
                        tracks.append(newSoundCloudTrack)
                    }
                }
            }
            //Call the closure to complete
            completed()
        }
    }
}
