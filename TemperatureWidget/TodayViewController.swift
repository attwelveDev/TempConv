//
//  TodayViewController.swift
//  TemperatureWidget
//
//  Created by Aaron Nguyen on 3/10/16.
//  Copyright © 2016 Aaron Nguyen. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet weak var looks1: UILabel!
    @IBOutlet weak var looks2: UILabel!
    @IBOutlet weak var looks3: UILabel!
    @IBOutlet weak var looks4: UILabel!
    @IBOutlet weak var looks5: UILabel!
    @IBOutlet weak var looks6: UILabel!
    @IBOutlet weak var looks7: UILabel!
    @IBOutlet weak var looks8: UILabel!
    @IBOutlet weak var looks9: UILabel!
    @IBOutlet weak var looks10: UILabel!
    @IBOutlet weak var looks11: UILabel!
    @IBOutlet weak var looks12: UILabel!
    @IBOutlet weak var looks13: UILabel!
    @IBOutlet weak var looks14: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.

        self.preferredContentSize = CGSize(width: 320, height: CGFloat(121 + 44))
        
        if #available(iOSApplicationExtension 10.0, *) {
            self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        } else {
            // Fallback on earlier versions
        }
        
        looks1.layer.cornerRadius = 10.0
        looks1.clipsToBounds = true
        looks2.layer.cornerRadius = 10.0
        looks2.clipsToBounds = true
        looks3.layer.cornerRadius = 10.0
        looks3.clipsToBounds = true
        looks4.layer.cornerRadius = 10.0
        looks4.clipsToBounds = true
        looks5.layer.cornerRadius = 10.0
        looks5.clipsToBounds = true
        looks6.layer.cornerRadius = 10.0
        looks6.clipsToBounds = true
        looks7.layer.cornerRadius = 10.0
        looks7.clipsToBounds = true
        looks8.layer.cornerRadius = 10.0
        looks8.clipsToBounds = true
        looks9.layer.cornerRadius = 10.0
        looks9.clipsToBounds = true
        looks10.layer.cornerRadius = 10.0
        looks10.clipsToBounds = true
        looks11.layer.cornerRadius = 10.0
        looks11.clipsToBounds = true
        looks12.layer.cornerRadius = 10.0
        looks12.clipsToBounds = true
        looks13.layer.cornerRadius = 10.0
        looks13.clipsToBounds = true
        looks14.layer.cornerRadius = 10.0
        looks14.clipsToBounds = true
        
    }
    
    @available(iOS 10.0, *)
    @available(iOSApplicationExtension 10.0, *)
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        self.preferredContentSize = (activeDisplayMode == .expanded) ? CGSize(width: 320, height: CGFloat(121 + 64)) : CGSize(width: maxSize.width, height: 110)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func widgetPerformUpdate(_ completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
