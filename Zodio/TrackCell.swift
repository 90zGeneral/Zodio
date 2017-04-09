//  TrackCell.swift
//  Zodio

import UIKit

class TrackCell: UITableViewCell {
    
    //Outlets
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var username: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //Cell configuration
    func configureCell(track: SoundCloudTrack) {
        
        //Assignment for cell content
        trackName.text = track.trackName
        username.text = "from " + track.username
    }

}
