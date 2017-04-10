//  SoundCloudTrack.swift
//  Zodio

import Foundation

class SoundCloudTrack {
    
    //Private variables
    fileprivate var _trackName: String!
    fileprivate var _username: String!
    fileprivate var _trackImg: String!
    fileprivate var _streamUrl: String!
    fileprivate var _userID: String!
    
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
    
    var streamUrl: String {
        if _streamUrl == nil {
            _streamUrl = ""
        }
        return _streamUrl
    }
    
    //Initializer
    init(trackDict: [String: Any]) {
        
        //Grab the title for the track
        if let trackTitle = trackDict["title"] as? String {
            self._trackName = trackTitle
        }
        
        //Grab the image artwork for the track
        if let trackArtwork = trackDict["artwork_url"] as? String {
            self._trackImg = trackArtwork
        }
        
        //Grab the streaming link to play audio
        if let streamingLink = trackDict["stream_url"] as? String {
            self._streamUrl = streamingLink
        }
        
        //Grab the username attached to this track
        if let userDict = trackDict["user"] as? [String: Any] {
            if let user = userDict["username"] as? String {
                self._username = user
            }
        }
    }
}
