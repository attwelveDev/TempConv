//
//  DeveloperTableViewController.swift
//  Temperature
//
//  Created by Aaron Nguyen on 6/1/17.
//  Copyright © 2017 Aaron Nguyen. All rights reserved.
//

import UIKit
import StoreKit

class DeveloperTableViewController: UITableViewController, SKStoreProductViewControllerDelegate {

    @IBOutlet var tableContent: UITableView!
    let quickTap = [
        ("Get QuickTap"),
        ]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return quickTap.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.textColor = UIColor.white
        
        if indexPath.section == 0 {
            let (versionName) = quickTap[indexPath.row]
            cell.textLabel?.text = versionName
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "QuickTap"
        }
        return ""
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(white: 1, alpha: 0.5)
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        
        header.textLabel?.textColor = UIColor.white
        header.tintColor = UIColor(white: 1, alpha: 0)
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return "QuickTap is all about tapping quickly, hence the name. QuickTap comprises of two modes in Singleplayer; Time Mode and Highscore Mode that sit along side Multiplayer's two modes; AcrossTable Mode and Territorial Mode. When you've become too tired, jump over to Tapedup World to check out other Tapedupers. You'll always be engaged because of the huge range of choices."
        }
        return ""
    }
    
    override func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        let footer: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        
        footer.textLabel?.textColor = UIColor.white
        footer.tintColor = UIColor.white
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section == 0 && indexPath.row == 0) {

            activityIndicator("Loading")
            
            let storeVc = SKStoreProductViewController()
            storeVc.delegate = self
            
            let parameters = [SKStoreProductParameterITunesItemIdentifier: NSNumber(value: 1190851546)]
            
            storeVc.loadProduct(withParameters: parameters, completionBlock: { (result, error) in
                
                self.effectView.removeFromSuperview()
                
                if result {
                    self.present(storeVc, animated: true, completion: nil)
                } else {
                    if let unwrappedError = error {
                        self.animateIn()
                        self.errorDescription.text = "\(unwrappedError.localizedDescription)"
                    }
                }
            })
            
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func productViewControllerDidFinish(_ viewController: SKStoreProductViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    var activityIndicator = UIActivityIndicatorView()
    var strLabel = UILabel()
    let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    
    func activityIndicator(_ title: String) {
        
        strLabel.removeFromSuperview()
        activityIndicator.removeFromSuperview()
        effectView.removeFromSuperview()
        
        strLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 160, height: 45))
        strLabel.text = title
        strLabel.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        strLabel.textColor = UIColor.white
        
        effectView.frame = CGRect(x: view.frame.midX - strLabel.frame.width / 2, y: view.frame.midY - strLabel.frame.height / 2 , width: 160, height: 45)
        effectView.center = CGPoint(x: view.center.x , y: view.center.y - (navigationController?.navigationBar.frame.height)!)
        effectView.layer.cornerRadius = 10
        effectView.layer.masksToBounds = true
        
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 45, height: 45)
        activityIndicator.startAnimating()
        
        effectView.contentView.addSubview(activityIndicator)
        effectView.contentView.addSubview(strLabel)
        view.addSubview(effectView)
    }

    
    let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.regular))
    
    func animateIn() {
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            blurEffectView.frame = self.view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            self.view.addSubview(blurEffectView)
            blurEffectView.alpha = 0
        }
        
        self.view.addSubview(self.errorView)
        
        errorView.center = CGPoint(x: view.center.x , y: view.center.y - (navigationController?.navigationBar.frame.height)!)
        
        errorView.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        errorView.alpha = 0
        
        UIView.animate(withDuration: 0.2) {
            
            self.navigationController?.navigationBar.alpha = 0.000001
            
            self.blurEffectView.alpha = 1
            self.blurEffectView.transform = CGAffineTransform.identity
            
            self.errorView.alpha = 1
            self.errorView.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut() {
        UIView.animate(withDuration: 0.2, animations: {
            self.errorView.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
            self.errorView.alpha = 0
            self.blurEffectView.alpha = 0
            
            self.navigationController?.navigationBar.alpha = 1
            
        }){(success: Bool) in
            self.errorView.removeFromSuperview()
            self.blurEffectView.removeFromSuperview()
        }
    }
    
    @IBAction func okAction(_ sender: Any) {
        animateOut()
    }
    
    @IBOutlet var errorView: UIView!
    @IBOutlet weak var errorDescription: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "More Apps"
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        }
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        let backgroundImage = UIImage(named: "gradient_back")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        tableContent.delegate = self
        tableContent.dataSource = self
        
        if tableContent.contentSize.height < tableContent.frame.size.height {
            tableContent.isScrollEnabled = false
        } else {
            tableContent.isScrollEnabled = true
        }
        
        errorView.layer.cornerRadius = 10.0
        errorView.clipsToBounds = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
