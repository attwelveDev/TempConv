//
//  ActualAboutViewController.swift
//  Temperature
//
//  Created by Aaron Nguyen on 5/10/16.
//  Copyright © 2016 Aaron Nguyen. All rights reserved.
//

import UIKit
import SafariServices

class ActualAboutViewController: UIViewController, SFSafariViewControllerDelegate {

    @IBOutlet weak var textViewLooks: UITextView!
    @IBAction func redirectLink(_ sender: AnyObject) {
        func showTutorial() {
            if let url = URL(string: "https://sites.google.com/view/attwelve/home") {
                let vc = SFSafariViewController(url: url, entersReaderIfAvailable: false)
                present(vc, animated: true)
                
                vc.preferredBarTintColor = UIColor(red: 19/255, green: 112/255, blue: 246/255, alpha: 1)
                vc.preferredControlTintColor = UIColor(white: 1, alpha: 0.75)
            }
        }
        
        showTutorial()
    }
    @IBOutlet weak var redirectLinkLooks: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "About"
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        textViewLooks.layer.cornerRadius = 5.0
        textViewLooks.clipsToBounds = true
        
        redirectLinkLooks.layer.cornerRadius = 5.0
        redirectLinkLooks.clipsToBounds = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
