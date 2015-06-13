//
//  PhotosViewController.swift
//  codepath-instagram
//
//  Created by Patrick on 6/9/15.
//  Copyright (c) 2015 Daily Doog Inc. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var feedTableView: UITableView!
    
    duration

    override func viewDidLoad() {
        super.viewDidLoad()

        feedTableView.delegate = self
        feedTableView.dataSource = self
        
        var clientId = "a3fe963389494f199aa550a2dbf55e73"
        var instaUrl = NSURL(string: "https://api.instagram.com/v1/media/popular?client_id=\(clientId)")!
        var request = NSURLRequest(URL: instaUrl)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
            (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            var responseDictionary = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as! NSDictionary
            self.photos = responseDictionary["data"] as! NSArray
            self.feedTableView.reloadData()
            // println("response: \(self.photos)")
        }
        
    }
    
    // How many rows in TableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    // View for the cell in the TableView
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = feedTableView.dequeueReusableCellWithIdentifier("PhotoCell") as! PhotoCell
        var photo = photos[indexPath.row] as! NSDictionary
        var photoUrl = photo.valueForKeyPath("images.low_resolution.url") as? String
        // cell.instaUrlLabel.text = photo.valueForKeyPath("images.low_resolution.url") as? String
        cell.instaImageView.setImageWithURL(NSURL(string: photoUrl!))
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Determine which row was selected
        var cell = sender as! UITableViewCell
        var indexPath = feedTableView.indexPathForCell(cell)
        
        // Get the view controller that we're transitioning to.
        var photosDetailsViewController = segue.destinationViewController as! PhotosDetailsViewController
        
        // Set the data of the view controller
        var photo = photos[indexPath!.row] as! NSDictionary
        var photoUrl = photo.valueForKeyPath("images.low_resolution.url") as? String
        photosDetailsViewController.photoUrl = photoUrl
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
