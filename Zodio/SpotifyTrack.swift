//  SpotifyTrack.swift
//  Zodio

import Foundation

class SpotifyTrack {
    
    //Private variables
    fileprivate var _trackName: String!
    fileprivate var _artist: String!
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
    
    var artist: String {
        if _artist == nil {
            _artist = ""
        }
        return _artist
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
        if let trackTitle = trackDict["name"] as? String {
            self._trackName = trackTitle
        }
        
        //Grab the image artwork for the track
        if let trackAlbum = trackDict["album"] as? [String: Any] {
            if let tracksImages = trackAlbum["images"] as? [[String: Any]] {
                if let image = tracksImages[0]["url"] as? String {
                    self._trackImg = image
                }
            }
        }
        
        //Grab the streaming link to play audio
        if let streamingLink = trackDict["preview_url"] as? String {
            self._streamUrl = streamingLink
            
        }else {
            self._streamUrl = "https://p.scdn.co/mp3-preview/c279b4f2b4640e54570f8403e05233c6b5f3aa52?cid=null"
        }
        
        //Grab the artist attached to this track
        if let artists = trackDict["artists"] as? [[String: Any]] {
            if let artistName = artists[0]["name"] as? String {
                self._artist = artistName
            }
        }
    }
}
