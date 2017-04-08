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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //Deactivate the search button
        searchBtn.isEnabled = false
        searchBtn.backgroundColor = UIColor.lightGray
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //Reactivate the search button
        searchBtn.isEnabled = true
        searchBtn.backgroundColor = UIColor.black
    }
    
    @IBAction func search(_ sender: UIButton) {
        //Make sure the search bar is not empty
        if zodiacSearch.text != nil && zodiacSearch.text != "" && zodiacSearch.text != " " {
            
            if zodiacSearch.text?.characters.last == " " {
                
                zodiacSearch.text?.characters.removeLast()
            }
            
            //Function call to update userInput and the url components
            updateURL(input: zodiacSearch.text!)
            
            fetchData.downloadSoundCloudTrackDetails {
                
                //Empty out the textField
                self.zodiacSearch.text = nil
            }
            
            performSegue(withIdentifier: "TracksVC", sender: nil)
        }
        
        zodiacSearch.resignFirstResponder()
    }
}
