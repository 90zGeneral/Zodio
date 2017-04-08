//
//  UserTackCell.swift
//  Zodio
//
//  Created by Roydon Jeffrey on 4/7/17.
//  Copyright © 2017 Italyte. All rights reserved.
//

import UIKit

class UserTackCell: UITableViewCell {
    
    @IBOutlet weak var userTrackTitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureUserCell(userTrack: SoundCloudTrack) {
    
    }

}
