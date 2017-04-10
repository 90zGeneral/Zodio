//  GlobalVariables.swift
//  Zodio

import Foundation

//Array of songs
var tracks = [SoundCloudTrack]()
var userTracks = [SoundCloudTrack]()

//Variables declaration
var userInput: String!
var completeUrl: String!

//A control state
var whichArrayToUse = ""

func updateURL(input: String) {
    
    //Constants for the api endpoint
    userInput = input
    let UrlBase = "http://api.soundcloud.com"
    let urlTrack = "/tracks?q=" + userInput + "&limit=10&"
    let myClientID = "client_id=d6i0wruU7ddayTqrhwszluW0i9aNBlb1"
    completeUrl = UrlBase + urlTrack + myClientID
}

//Alias for closure
typealias DownloadComplete = () -> ()
