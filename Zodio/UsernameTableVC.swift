//  UsernameTableVC.swift
//  Zodio

import UIKit

class UsernameTableVC: UITableViewController {
    
    //Outlets
    @IBOutlet weak var usernameTitle: UILabel!
    @IBOutlet var userSongTable: UITableView!
    
    //New instances
    var userSpotifyTrack: SpotifyTrack!
    var fetchUserData = FetchData()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userSongTable.delegate = self
        userSongTable.dataSource = self
        
        //Label assignment
        usernameTitle.text = "Tracks from " + userSpotifyTrack.username.capitalized
        
        //To update the state on which array to use to populate the table
        whichArrayToUse = "userTracks"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //Function call
        fetchUserData.downloadSpotifyTrackDetails {
            
            //Reload table
            self.userSongTable.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        userSongTable.reloadData()
    }

    //Number of sections in table
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    //number of row in the section(s) of the table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return userTracks.count
    }

    //To handle the display of the cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as? UserTackCell {
            let thisTrack = userTracks[indexPath.row]
            cell.configureUserCell(userTrack: thisTrack)
            
            return cell
            
        }else {
            
            return UITableViewCell()
        }
    }
}
