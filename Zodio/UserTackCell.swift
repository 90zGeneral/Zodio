//
//  UserTackCell.swift
//  Zodio
//
//  Created by Roydon Jeffrey on 4/7/17.
//  Copyright © 2017 Italyte. All rights reserved.
//

import UIKit

class UserTackCell: UITableViewCell {
    
    //Outlet
    @IBOutlet weak var userTrackTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //Cell configuration
    func configureUserCell(userTrack: SoundCloudTrack) {
        
        //Assignment for cell content
        userTrackTitle.text = userTrack.trackName
    
    }

}
