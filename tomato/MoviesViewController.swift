//
//  MoviesViewController.swift
//  tomato
//
//  Created by Alena Nikitina on 9/12/14.
//  Copyright (c) 2014 Alena Nikitina. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var notificationView: UIView!
    @IBOutlet weak var notificationLabel: UILabel!

    @IBOutlet weak var tapLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var refreshControl:UIRefreshControl!
    
    var url = "http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=xqvu3ksq26ty6gfpu9km5ktp&limit=20&country=us"
    
    var movies: [NSDictionary] = []
    var service:MovieService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var whiteColor = UIColor(white: 0.8, alpha: 1)
        
        tapLabel.text = "Tap to retry"
        
        self.activityIndicator.startAnimating()
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl.backgroundColor = UIColor(red: 1.0, green: 0.81, blue: 0.19, alpha: 1.0)
        
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refersh")
        self.refreshControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView.addSubview(refreshControl)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        loadMovies()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onNotificationTap(sender: AnyObject) {
        self.notificationView.alpha = 0
        loadMovies()
    }
    
    func loadMovies(){
        self.activityIndicator.startAnimating()
        service = MovieService()
        service.getMovies(url) {
            (response) in
            if(response["error"] != nil) {
                self.activityIndicator.stopAnimating()
                self.refreshControl.endRefreshing()
                self.notificationLabel.text = response["error"] as? String
                self.notificationView.alpha = 1
            } else {
                self.movies = response["movies"] as [NSDictionary]
                self.tableView.reloadData()
                self.refreshControl.endRefreshing()
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    func refresh(sender:AnyObject) {
        self.activityIndicator.startAnimating()
        loadMovies()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell =  tableView.dequeueReusableCellWithIdentifier("MovieCell") as MovieCell
        var movie: AnyObject = movies[indexPath.row]
        
        var bgColorView = UIView()
        bgColorView.backgroundColor = UIColor(red: 1.0, green: 0.81, blue: 0.19, alpha: 1.0)
        cell.selectedBackgroundView = bgColorView
        
        cell.titleLabel.text = movie["title"] as? String
        cell.synopsisLabel.text = movie["synopsis"] as? String
        
        var posters = movie["posters"] as NSDictionary
        var posterUrl = posters["thumbnail"] as String
        cell.posterView.setImageWithURL(NSURL(string: posterUrl))
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "showDetails") {
            let myDestVC = segue.destinationViewController as MDetailsViewController
            let indexPath = self.tableView.indexPathForSelectedRow()!
        
            myDestVC.movie = self.movies[indexPath.row]
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
