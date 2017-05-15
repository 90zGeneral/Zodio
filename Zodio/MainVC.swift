//  MainVC.swift
//  Zodio

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //Which button was selected
    @IBAction func zodiacSignTouched(_ sender: UIButton) {
        
        //Grab the button's tag number
        let buttonTag = sender.tag
        let zodiacString: String!
        
        //Which on the tag number
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
        
        //Perform segue
        performSegue(withIdentifier: "TracksVC", sender: zodiacString)
        
        //Empty out the array
        tracks.removeAll()
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
