//  MainVC.swift
//  Zodio

import UIKit

class MainVC: UIViewController {
    
    //Outlet
    @IBOutlet weak var zodiacSearch: UITextField!
    
    let fetchData = FetchData()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func search(_ sender: UIButton) {
        //Make sure the search bar is not empty
        if zodiacSearch.text != nil || zodiacSearch.text != "" || zodiacSearch.text != " " {
            
//            tracks.removeAll()
            
            //Assign the search bar text to userInput
            userInput = zodiacSearch.text
            
            //Empty out the textField
            zodiacSearch.text = ""
            
            fetchData.downloadSoundCloudTrackDetails {
                print(tracks.count)
            }
        }
        
        zodiacSearch.resignFirstResponder()
    }
}
