//  SelectedTrackVC.swift
//  Zodio

import UIKit

class SelectedTrackVC: UIViewController {
    
    fileprivate var _chosenTrack: SoundCloudTrack!
    
    var chosenTrack: SoundCloudTrack {
        get {
            return _chosenTrack
        }set {
            _chosenTrack = newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
