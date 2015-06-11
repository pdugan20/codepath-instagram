//
//  PhotosDetailsViewController.swift
//  codepath-instagram
//
//  Created by Patrick Dugan on 6/10/15.
//  Copyright (c) 2015 Daily Doog Inc. All rights reserved.
//

import UIKit

class PhotosDetailsViewController: UIViewController {

    @IBOutlet weak var instaImageView: UIImageView!
    var photoUrl: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        instaImageView.setImageWithURL(NSURL(string: photoUrl!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
