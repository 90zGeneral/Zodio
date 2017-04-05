
import UIKit

class TracksVC: UITableViewController {
    
    //Outlets
    @IBOutlet weak var songsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        songsTableView.delegate = self
        songsTableView.dataSource = self
        
        songsTableView.reloadData()
        
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //
    }
}

