//  TracksVC.swift
//  Zodio

import UIKit

class TracksVC: UITableViewController {
    
    //Outlets
    @IBOutlet weak var songsTableView: UITableView!
    
    //New Instance of FetchData class
    let fetchData = FetchData()
    
    var inputString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songsTableView.delegate = self
        songsTableView.dataSource = self
        
        //Function call to update userInput and the url components
        updateURL(input: inputString)
        
        //To update the state on which array to use to populate the table
        whichArrayToUse = "tracks"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //Empty out the array everytime this viewController is ready to appear
        tracks.removeAll()
        
        //Function call to api network request
        fetchData.downloadSpotifyTrackDetails {
            
            //Reload the table after the data finish downloading and just before the view appears
            self.songsTableView.reloadData()
            
            print("Yes, \(tracks.count)")
        }
        
        print(tracks.count)
    }
    
    //Number of sections in the tableView
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Number of rows in the tableView's sections
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tracks.count
    }
    
    //Handles the display of the cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as? TrackCell {
            let eachTrack = tracks[indexPath.row]
            cell.configureCell(track: eachTrack)
            
            return cell
            
        }else {
            
            return UITableViewCell()
        }
    }
    
    //Determines which cell was selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedSong = tracks[indexPath.row]
        
        //Perform segue
        performSegue(withIdentifier: "TrackChosen", sender: selectedSong)
    }
    
    //Prepare the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SelectedTrackVC {
            if let thisTrack = sender as? SpotifyTrack {
                destination.spotifyTrack = thisTrack
            }
        }
    }
}

