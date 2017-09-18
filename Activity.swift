//
//  Activity.swift
//  Temperature
//
//  Created by Aaron Nguyen on 15/10/16.
//  Copyright © 2016 Aaron Nguyen. All rights reserved.
//

import UIKit

class Activity: UIActivity {

    override func activityType() -> String?{
        return NSStringFromClass(self.classForCoder)
    }
    
    override func activityTitle() -> String?{
        return "TempConv Site"
    }
    
    override func activityImage() -> UIImage?{
        return UIImage(named: "site_icon")
    }
    
    override class func activityCategory() -> UIActivityCategory{
        return UIActivityCategory.action
    }
    
    override func canPerform(withActivityItems activityItems: [AnyObject]) -> Bool {
        for activityItem in activityItems{
            if activityItem.isKind(NSURL.self){
                let url = activityItem as? URL
                return UIApplication.shared.canOpenURL(url!)
            }
        }
        return false
    }
    
    override func prepare(withActivityItems activityItems: [AnyObject]) {
        for activityItem in activityItems{
            if activityItem.isKind(NSURL.self){
                let url = activityItem as? URL
                if UIApplication.shared.canOpenURL(url!){
                    UIApplication.shared.openURL(url!)
                }
                break
            }
        }
    }
}

