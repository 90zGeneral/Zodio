//  GlobalVariables.swift
//  Zodio

import Foundation

//Array of songs
var tracks = [SpotifyTrack]()
var userTracks = [SpotifyTrack]()

//Variables declaration
var userInput: String!
var completeUrl: String!

//A control state
var whichArrayToUse = ""

func updateURL(input: String) {
    
    //Constants for the api endpoint
    userInput = input
    let UrlBase = "https://api.spotify.com"
    let urlTrack = "/v1/search?q=" + userInput + "&type=track"

    completeUrl = UrlBase + urlTrack
}

//Alias for closure
typealias DownloadComplete = () -> ()
