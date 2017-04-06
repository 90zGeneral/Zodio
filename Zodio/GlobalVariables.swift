//  GlobalVariables.swift
//  Zodio

import Foundation

//Array of songs
var tracks = [SoundCloudTrack]()

//Grab the user's input
var userInput: String!

//Constants for the api endpoint
let UrlBase = "http://api.soundcloud.com"
let urlTrack = "/tracks?q=" + userInput + "&"
let myClientID = "client_id=d6i0wruU7ddayTqrhwszluW0i9aNBlb1"
let completeUrl = UrlBase + urlTrack + myClientID

//Alias for closure
typealias DownloadComplete = () -> ()
