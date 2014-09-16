//
//  service.swift
//  tomato
//
//  Created by Alena Nikitina on 9/13/14.
//  Copyright (c) 2014 Alena Nikitina. All rights reserved.
//

import Foundation

class MovieService {
    
    func getMovies(url: String, callback:(NSDictionary) -> ()) {
        requestAsync(url, callback: callback)
    }
    
    func requestAsync(url:String, callback:(NSDictionary) -> ()) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        var request = NSURLRequest(URL: NSURL(string: url))
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response: NSURLResponse!, data: NSData!, error: NSError?) -> Void in
            
            if (error != nil) {
                var desc = error!.localizedDescription
                var object:NSDictionary = ["error": desc]
                callback(object)
                
            } else {
                var localError:NSError?
                var object = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &localError) as NSDictionary
                callback(object)
            }
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        }
    }
}