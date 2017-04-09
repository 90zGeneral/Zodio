//  MainVC.swift
//  Zodio

import UIKit

class MainVC: UIViewController, UITextFieldDelegate {
    
    //Outlet
    @IBOutlet weak var zodiacSearch: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        zodiacSearch.delegate = self
    }
    
    //Activate the return key on the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //Make sure the search bar is not empty
        if zodiacSearch.text != nil && zodiacSearch.text != "" && zodiacSearch.text != " " {
            
            //Remove the empty space at the end of the input string from the keyboard recommendations
            if zodiacSearch.text?.characters.last == " " {
                
                zodiacSearch.text?.characters.removeLast()
            }
            
            let zodiacString = zodiacSearch.text
            
            //Perform segue
            performSegue(withIdentifier: "TracksVC", sender: zodiacString)
        }
        
        //Empty out the tracks array, textField, and disable the keyboard
        tracks.removeAll()
        zodiacSearch.text = ""
        zodiacSearch.resignFirstResponder()
        
        return true
    }
    
    //Prepare for the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? TracksVC {
            if let inputString = sender as? String {
                destination.inputString = inputString
            }
        }
    }
}
