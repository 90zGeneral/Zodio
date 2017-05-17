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
            
            //To store the results being returned a dictionary
            if let responseDict = response.result.value as? [String: Any] {
                
                //Access the only key from responseDict where all the info lives
                if let theTracks = responseDict["tracks"] as? [String: Any] {
                    
                    //Grab the array that contains all the tracks
                    if let items = theTracks["items"] as? [[String: Any]] {
                        
                        //Loop over the array
                        for item in items {
                            
                            //New Instance for each dictionary in the array
                            let newSpotifyTrack = SpotifyTrack(trackDict: item)
                            
                            //To decide which array to append into for populating the tableviews
                            if whichArrayToUse == "tracks" {
                                
                                tracks.append(newSpotifyTrack)
                                
                            }else if whichArrayToUse == "userTracks" {
                                
                                userTracks.append(newSpotifyTrack)
                            }
                        }
                    }
                }
            }
            //Call the closure to complete
            completed()
        }
    }
}
