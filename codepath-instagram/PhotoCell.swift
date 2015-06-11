//
//  PhotoCell.swift
//  codepath-instagram
//
//  Created by Patrick Dugan on 6/9/15.
//  Copyright (c) 2015 Daily Doog Inc. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {

    @IBOutlet weak var instaUrlLabel: UILabel!
    @IBOutlet weak var instaImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
