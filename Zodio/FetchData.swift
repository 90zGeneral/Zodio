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
    func downloadSpotifyTrackDetails(completed: @escaping DownloadComplete) {
        
        //String conversion to URL
        let theFullUrl = URL(string: completeUrl)!
        
        //GET request
        Alamofire.request(theFullUrl).responseJSON { (response) in
            
            //To store the results being returned as an array of dictionaries
            if let arrayOfDicts = response.result.value! as? [[String: Any]] {
                
                //Loop over the array
                for eachTrackDict in arrayOfDicts {
                    
                    //New Instance for each dictionary in the array
                    let newSpotifyTrack = SpotifyTrack(trackDict: eachTrackDict)
                    
                    //Limit the array to 5 tracks at a time
                    if whichArrayToUse == "tracks" {
                        tracks.append(newSpotifyTrack)
                    }else if whichArrayToUse == "userTracks" {
                        userTracks.append(newSpotifyTrack)
                    }
                }
            }
            //Call the closure to complete
            completed()
        }
    }
}
