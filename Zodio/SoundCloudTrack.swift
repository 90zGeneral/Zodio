//
//  SoundCloudTrack.swift
//  Zodio
//


import Foundation
import Alamofire

class SoundCloudTrack {
    
    fileprivate var _trackName: String!
    fileprivate var _username: String!
    fileprivate var _trackImg: String!
    fileprivate var _trackUrl: String!
    
    //Getters
    var trackName: String {
        if _trackName == nil {
            _trackName = ""
        }
        return _trackName
    }
    
    var username: String {
        if _username == nil {
            _username = ""
        }
        return _username
    }
    
    var trackImg: String {
        if _trackImg == nil {
            _trackImg = ""
        }
        return _trackImg
    }
    
    var trackUrl: String {
        if _trackUrl == nil {
            _trackUrl = ""
        }
        return _trackUrl
    }
    
    init(object: [String: Any]) {
        self._trackUrl = "\(UrlBase)\(urlTrack)\(myClientID)"
    }
    
    //To make the network call to the api
    func downloadSoundCloudTrackDetails(completed: @escaping DownloadComplete) {
        
        //GET request
        Alamofire.request(_trackUrl).responseJSON { (response) in
            
            //To store the results being returned as an array of dictionaries
            if let arrayOfDicts = response.result.value! as? [[String: Any]] {
                
                //Loop over the array
                for dict in arrayOfDicts {
                    let obj = SoundCloudTrack(object: dict)
                    tracks.append(obj)
                    
                    //Grab the title for the track
                    if let trackTitle = dict["title"] as? String {
                        self._trackName = trackTitle
                    }
                    
                    //Grab the image artwork for the track
                    if let trackArtwork = dict["artwork_url"] as? String {
                        self._trackImg = trackArtwork
                    }
                    
                    //Grab the username attached to this track
                    if let userDict = dict["user"] as? [String: Any] {
                        if let user = userDict["username"] as? String {
                            self._username = user
                        }
                    }
                }
            }
            //Call the closure to complete
            completed()
        }
    }
}
