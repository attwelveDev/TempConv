//
//  AboutTableViewController.swift
//  Temperature
//
//  Created by Aaron Nguyen on 18/10/16.
//  Copyright © 2016 Aaron Nguyen. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI

class AboutTableViewController: UITableViewController, SFSafariViewControllerDelegate, MFMailComposeViewControllerDelegate {
    @IBOutlet var versionView: UIView!
    @IBOutlet weak var versionInfoLooks: UILabel!
    @IBOutlet weak var dismissBTNLooks: UIButton!
    
    @IBAction func dismissView(_ sender: AnyObject) {
        animateOut()
    }
    
    
    @IBOutlet var tableContent: UITableView!
    let version = [
        ("Version and Build"),
        ]
    
    let share = [
        ("Rate & Review"),
        ("Share via Mail")
        ]
    
    let about = [
        ("@Twelve Site"),
        ("Privacy Policy"),
        ("More from the Developer"),
        ("About")
    ]
    
    let settings = [
        ("Settings")
    ]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return version.count
        } else if section == 1 {
            return share.count
        } else if section == 2 {
            return about.count
        } else {
            return settings.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.textColor = UIColor.white
        
        if indexPath.section == 0 {
            let (versionName) = version[indexPath.row]
            cell.textLabel?.text = versionName
        } else if indexPath.section == 1 {
            let (shareName) = share[indexPath.row]
            cell.textLabel?.text = shareName
        } else if indexPath.section == 2 {
            let (aboutName) = about[indexPath.row]
            cell.textLabel?.text = aboutName
        } else {
            let (settingsName) = settings[indexPath.row]
            cell.textLabel?.text = settingsName
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Version and Build"
        } else if section == 1 {
            return "Share"
        } else if section == 2 {
            return "About"
        } else  {
            return "Settings"
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(white: 1, alpha: 0.5)
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        
        header.textLabel?.textColor = UIColor.white
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if (indexPath.section == 0 && indexPath.row == 0) {
            animateIn()
        } else if (indexPath.section == 1 && indexPath.row == 0) {
            
            if let url = URL(string: "https://itunes.apple.com/us/app/tempconv/id1163432921?ls=1&mt=8") {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    // Fallback on earlier versions
                }
            }
            
        } else if (indexPath.section == 1 && indexPath.row == 1) {
            
            let mailComposeViewController = configuredMailComposeViewController()
            if MFMailComposeViewController.canSendMail() {
                self.present(mailComposeViewController, animated: true, completion: nil)
            } else {
                self.showSendMailErrorAlert()
            }
            
            
        } else if (indexPath.section == 2 && indexPath.row == 0) {

            if let url = URL(string: "https://sites.google.com/view/attwelve") {
                let vc = SFSafariViewController(url: url, entersReaderIfAvailable: false)
                present(vc, animated: true)
                
                vc.preferredBarTintColor = UIColor(red: 19/255, green: 112/255, blue: 246/255, alpha: 1)
                vc.preferredControlTintColor = UIColor(white: 1, alpha: 0.75)

            }

        } else if (indexPath.section == 2 && indexPath.row == 1) {
            
            if let url = URL(string: "https://sites.google.com/view/attwelve/privacy-policy") {
                let vc = SFSafariViewController(url: url, entersReaderIfAvailable: false)
                present(vc, animated: true)
                
                vc.preferredBarTintColor = UIColor(red: 19/255, green: 112/255, blue: 246/255, alpha: 1)
                vc.preferredControlTintColor = UIColor(white: 1, alpha: 0.75)
                
            }
            
        } else if (indexPath.section == 2 && indexPath.row == 2) {
            
            let identity = "moreFromTheDeveloper"
            let vcName = identity
            let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
            self.navigationController?.pushViewController(viewController!, animated: true)
        } else if (indexPath.section == 2 && indexPath.row == 3) {
            
            let identity = "About"
            let vcName = identity
            let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
            self.navigationController?.pushViewController(viewController!, animated: true)
        } else if (indexPath.section == 3 && indexPath.row == 0) {
            
            let identity = "settingsTBV"
            let vcName = identity
            let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
            self.navigationController?.pushViewController(viewController!, animated: true)
        }
        
    }
    
    @IBOutlet var mailErrorView: UIView!
    @IBOutlet weak var cannotLBL: UILabel!
    @IBOutlet weak var pleaseLBL: UILabel!
    @IBOutlet weak var okBTN: UIButton!
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        UINavigationBar.appearance().barTintColor = UIColor(red: 0.00, green: 0.42, blue: 0.98, alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        UINavigationBar.appearance().tintColor = UIColor.white
        
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        mailComposerVC.setToRecipients([""])
        mailComposerVC.setSubject("Download TempConv!")
        mailComposerVC.setMessageBody("Hello! I love TempConv and I think you should check it out! TempConv is the simplest temperature converter you will ever find on the App Store yet allows you to convert from Celsius, Fahrenheit and Kelvin with one swipe, no text-fields or complicated things so hard to explain. Download now: https://itunes.apple.com/us/app/tempconv/id1163432921?ls=1&mt=8", isHTML: false)
        
        return mailComposerVC
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
        
    }
    
    func showSendMailErrorAlert() {
        animateIn2()
    }
    
    func animateIn2() {
        self.tableView.isScrollEnabled = false
        
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            blurEffectView.frame = self.view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            self.view.addSubview(blurEffectView)
            blurEffectView.alpha = 0
        }
        
        self.view.addSubview(self.mailErrorView)
        mailErrorView.center = exactCenter
        
        mailErrorView.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        mailErrorView.alpha = 0
        
        UIView.animate(withDuration: 0.2) {
            
            self.navigationController?.navigationBar.alpha = 0.000001
            
            self.blurEffectView.alpha = 1
            self.blurEffectView.transform = CGAffineTransform.identity
            
            self.mailErrorView.alpha = 1
            self.mailErrorView.transform = CGAffineTransform.identity
        }
    }
    func animateOut2() {
        self.tableView.isScrollEnabled = true
        
        UIView.animate(withDuration: 0.2, animations: {
            self.mailErrorView.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
            self.mailErrorView.alpha = 0
            self.blurEffectView.alpha = 0
            
            self.navigationController?.navigationBar.alpha = 1
            
        }){(success: Bool) in
            self.mailErrorView.removeFromSuperview()
            self.blurEffectView.removeFromSuperview()
        }
    }
    
    @IBAction func dismissError(_ sender: Any) {
        animateOut2()
    }
    
    let exactCenter: CGPoint = CGPoint(x: UIScreen.main.bounds.size.width * 0.5,y: UIScreen.main.bounds.size.height * 0.5)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "More"
        navigationController?.navigationBar.barTintColor = UIColor(red:0.00, green:0.42, blue:0.98, alpha:1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        let backgroundImage = UIImage(named: "gradient_back")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        tableContent.delegate = self
        tableContent.dataSource = self
        
        versionView.layer.cornerRadius = 5
        let clearColour = UIColor(white: 1, alpha: 0.5)
        versionView.backgroundColor = clearColour
        
        versionInfoLooks.layer.cornerRadius = 5.0
        versionInfoLooks.clipsToBounds = true
        dismissBTNLooks.layer.cornerRadius = 5.0
        dismissBTNLooks.clipsToBounds = true
        
        mailErrorView.layer.cornerRadius = 5.0
        mailErrorView.clipsToBounds = true
        cannotLBL.layer.cornerRadius = 5.0
        cannotLBL.clipsToBounds = true
        pleaseLBL.layer.cornerRadius = 5.0
        pleaseLBL.clipsToBounds = true
        okBTN.layer.cornerRadius = 5.0
        okBTN.clipsToBounds = true
        
        var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.regular))
    
    func animateIn() {
        self.tableView.isScrollEnabled = false
        
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            blurEffectView.frame = self.view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            self.view.addSubview(blurEffectView)
            blurEffectView.alpha = 0
        }
        
        self.view.addSubview(self.versionView)
        
        versionView.center = exactCenter
        
        versionView.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        versionView.alpha = 0
        
        UIView.animate(withDuration: 0.2) {
            
            self.navigationController?.navigationBar.alpha = 0.000001
            
            self.blurEffectView.alpha = 1
            self.blurEffectView.transform = CGAffineTransform.identity
            
            self.versionView.alpha = 1
            self.versionView.transform = CGAffineTransform.identity
        }
    }
    func animateOut() {
        self.tableView.isScrollEnabled = true
        
        UIView.animate(withDuration: 0.2, animations: {
            self.versionView.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
            self.versionView.alpha = 0
            self.blurEffectView.alpha = 0
            
            self.navigationController?.navigationBar.alpha = 1
            
        }){(success: Bool) in
            self.versionView.removeFromSuperview()
            self.blurEffectView.removeFromSuperview()
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
