//
//  TomatoTabBarController.swift
//  tomato
//
//  Created by Alena Nikitina on 9/14/14.
//  Copyright (c) 2014 Alena Nikitina. All rights reserved.
//

import UIKit

class TomatoTabBarController: UITabBarController {
    @IBOutlet weak var movieTabBar: UITabBar!

    override func viewDidLoad() {
        super.viewDidLoad()
 
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor(red: 1.0, green: 0.81, blue: 0.19, alpha: 1.0)], forState:.Selected)
        
        self.movieTabBar.selectedImageTintColor = UIColor(red: 1.0, green: 0.81, blue: 0.19, alpha: 1.0)


        // Do any additional setup after loading the view.
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
