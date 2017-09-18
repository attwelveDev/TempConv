//
//  AboutViewController.swift
//  Temperature
//
//  Created by Aaron Nguyen on 30/9/16.
//  Copyright © 2016 Aaron Nguyen. All rights reserved.
//

import UIKit
import SafariServices

class AboutViewController: UIViewController, SFSafariViewControllerDelegate, SideBarDelegate {

    var sideBar: SideBar = SideBar()
    @IBOutlet weak var textView: UITextView!
    @IBAction func redirectLink(_ sender: AnyObject) {
        
        func showTutorial() {
            if let url = URL(string: "https://en.wikipedia.org/wiki/Temperature") {
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

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "Learn"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.view.backgroundColor = UIColor.cyan
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        textView.layer.cornerRadius = 5.0
        textView.clipsToBounds = true
        
        redirectLinkLooks.layer.cornerRadius = 5.0
        redirectLinkLooks.clipsToBounds = true
        
        sideBar = SideBar(sourceView: self.view, menuItems: ["From C°", "From F°", "From K", "Saved", "Add Widget", "More"])
        sideBar.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var delegate: SideBarDelegate?
    
    var sideBarBool: Bool = false {
        didSet {
            if sideBarBool == true {
                sideBar.showSideBar(true)
                delegate?.sideBarWillOpen?()
            } else {
                sideBar.showSideBar(false)
                delegate?.sideBarWillClose?()
            }
        }
    }
    
    @IBAction func openSideBar(_ sender: Any) {
        sideBarBool = !sideBarBool
    }
    
    func sideBarDidSelectButtonAtIndex(_ index: Int) {
        let identity = "aboutTBV"
        let identity2 = "3"
        let identity3 = "Fahrenheit"
        let identity4 = "WidgetHelp"
        let identity5 = "kToC"
        
        if index == 0 {
            
            let vcName = identity2
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let ivc = storyboard.instantiateViewController(withIdentifier: vcName)
            ivc.modalPresentationStyle = .custom
            ivc.modalTransitionStyle = .crossDissolve
            self.navigationController?.pushViewController(ivc, animated: true)
            
        } else if index == 1 {
            
            let vcName = identity3
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let ivc = storyboard.instantiateViewController(withIdentifier: vcName)
            ivc.modalPresentationStyle = .custom
            ivc.modalTransitionStyle = .crossDissolve
            self.navigationController?.pushViewController(ivc, animated: true)

        } else if index == 2 {
                
            let vcName = identity5
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let ivc = storyboard.instantiateViewController(withIdentifier: vcName)
            ivc.modalPresentationStyle = .custom
            ivc.modalTransitionStyle = .crossDissolve
            self.navigationController?.pushViewController(ivc, animated: true)
                
        } else if index == 3 {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let ivc = storyboard.instantiateViewController(withIdentifier: "save")
            ivc.modalPresentationStyle = .custom
            ivc.modalTransitionStyle = .crossDissolve
            self.navigationController?.pushViewController(ivc, animated: true)
            
        } else if index == 4 {
            
            let vcName = identity4
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let ivc = storyboard.instantiateViewController(withIdentifier: vcName)
            ivc.modalPresentationStyle = .custom
            ivc.modalTransitionStyle = .crossDissolve
            self.navigationController?.pushViewController(ivc, animated: true)

        } else if index == 5 {
            
            let vcName = identity
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let ivc = storyboard.instantiateViewController(withIdentifier: vcName)
            ivc.modalPresentationStyle = .custom
            ivc.modalTransitionStyle = .crossDissolve
            self.navigationController?.pushViewController(ivc, animated: true)
        }
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