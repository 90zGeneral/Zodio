//  UsernameTableVC.swift
//  Zodio

import UIKit

class UsernameTableVC: UITableViewController {
    
    
    @IBOutlet weak var usernameTitle: UILabel!
    @IBOutlet var userSongTable: UITableView!
    
    var userSoundCloudTrack: SoundCloudTrack!
    var fetchUserData = FetchData()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userSongTable.delegate = self
        userSongTable.dataSource = self
        
        usernameTitle.text = "Tracks from " + userSoundCloudTrack.username.capitalized
        
        whichArrayToUse = "userTracks"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        fetchUserData.downloadSoundCloudTrackDetails {
            
            //Reload
            self.userSongTable.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        userSongTable.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return userTracks.count
    }

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
