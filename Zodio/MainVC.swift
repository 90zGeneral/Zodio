//  MainVC.swift
//  Zodio

import UIKit

class MainVC: UIViewController, UITextFieldDelegate {
    
    //Outlet
    @IBOutlet weak var zodiacSearch: UITextField!
    @IBOutlet weak var searchBtn: UIButton!
    
    let fetchData = FetchData()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        zodiacSearch.delegate = self
        
        //Deactivate the search button
        searchBtn.isEnabled = false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //Reactivate the search button
        searchBtn.isEnabled = true
    }
    
    @IBAction func search(_ sender: UIButton) {
        //Make sure the search bar is not empty
        if zodiacSearch.text != nil || zodiacSearch.text != "" || zodiacSearch.text != " " {
            
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
