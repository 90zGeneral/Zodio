//  MainVC.swift
//  Zodio

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
//    
//    //Activate the return key on the keyboard
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        
//        //Make sure the search bar is not empty
//        if zodiacSearch.text != nil && zodiacSearch.text != "" && zodiacSearch.text != " " {
//            
//            //Remove the empty space at the end of the input string from the keyboard recommendations
//            if zodiacSearch.text?.characters.last == " " {
//                
//                zodiacSearch.text?.characters.removeLast()
//            }
//            
//            let zodiacString = zodiacSearch.text
//            
//            //Perform segue
//            performSegue(withIdentifier: "TracksVC", sender: zodiacString)
//        }
//        
//        //Empty out the tracks array, textField, and disable the keyboard
//        tracks.removeAll()
//        zodiacSearch.text = ""
//        zodiacSearch.resignFirstResponder()
//        
//        checkIfTextFieldIsEmpty(string: zodiacSearch.text)
//        
//        return true
//    }
    
    @IBAction func zodiacSignTouched(_ sender: UIButton) {
        
        let buttonTag = sender.tag
        let zodiacString: String!
        
        switch buttonTag {
        case 1:
            zodiacString = "aquarius"
        case 2:
            zodiacString = "pisces"
        case 3:
            zodiacString = "aries"
        case 4:
            zodiacString = "taurus"
        case 5:
            zodiacString = "gemini"
        case 6:
            zodiacString = "cancer"
        case 7:
            zodiacString = "leo"
        case 8:
            zodiacString = "virgo"
        case 9:
            zodiacString = "libra"
        case 10:
            zodiacString = "scorpio"
        case 11:
            zodiacString = "sagittarius"
        case 12:
            zodiacString = "capricorn"
        default:
            zodiacString = ""
        }
        
        performSegue(withIdentifier: "TracksVC", sender: zodiacString)
        
        tracks.removeAll()
        
        checkIfTextFieldIsEmpty(string: zodiacString)
        
    }
    
    
    //For Unit Testing purpose only 
    @discardableResult func checkIfTextFieldIsEmpty(string: String?) -> Bool {
        
        if let enteredString = string {
            print(enteredString)
            
            return true
        }
        
        return false
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
