//
//  GlobalVariables.swift
//  Zodio
//
//  Created by Roydon Jeffrey on 4/4/17.
//  Copyright © 2017 Italyte. All rights reserved.
//

import Foundation

//Array of songs
var tracks = [SoundCloudTrack]()

//Grab the user's input
var userInput: String!

let UrlBase = "http://api.soundcloud.com"
let urlTrack = "/tracks?q=\(userInput)&"
let myClientID = "client_id=d6i0wruU7ddayTqrhwszluW0i9aNBlb1"

//Alias for closure
typealias DownloadComplete = () -> ()
