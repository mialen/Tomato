//
//  MDetailsViewController.swift
//  tomato
//
//  Created by Alena Nikitina on 9/13/14.
//  Copyright (c) 2014 Alena Nikitina. All rights reserved.
//

import UIKit

class MDetailsViewController: UIViewController {
    
    @IBOutlet weak var movieScrollView: UIScrollView!
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var blurView: UIView!
    
    var movie: AnyObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        var title = movie!["title"] as String
        var year = movie!["year"] as Int
        var posters = movie!["posters"] as NSDictionary
        var posterUrl = posters["original"] as String
        
        var ratings = movie!["ratings"] as NSDictionary
        var critic = ratings["critics_score"] as Int
        var audience = ratings["audience_score"] as Int
        
        self.navigationItem.title = title
        
        titleLabel.text = "\(title) (\(year))"
        ratingLabel.text = "Critics score: \(critic), Audience score: \(audience)"
        synopsisLabel.text = movie!["synopsis"] as? String
        synopsisLabel.sizeToFit()
        
        var myFrame = synopsisLabel.frame
        movieScrollView.contentSize = CGSize(width: 320, height: 750 +  myFrame.height)
        
        var orgPosterUrl = posterUrl.stringByReplacingOccurrencesOfString("_tmb", withString: "_ori", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        bgImageView.setImageWithURL(NSURL(string: posterUrl))
        bgImageView.setImageWithURL(NSURL(string: orgPosterUrl), placeholderImage: nil)

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
