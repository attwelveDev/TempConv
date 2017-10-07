//
//  DeveloperTableViewController.swift
//  Temperature
//
//  Created by Aaron Nguyen on 6/1/17.
//  Copyright © 2017 Aaron Nguyen. All rights reserved.
//

import UIKit

class DeveloperTableViewController: UITableViewController {

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
            return "QuickTap is all about tapping quickly, hence the name. With two modes in Singleplayer, 'Time Mode' and 'Highscore Mode' and a competitive mode in Multiplayer. You'll always be engaged because of the huge range of choices."
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
            
            if let url = URL(string: "https://itunes.apple.com/us/app/quicktap/id1190851546?mt=8") {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    // Fallback on earlier versions
                }
            }
            
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "More Apps"
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 25), NSAttributedStringKey.foregroundColor: UIColor.white]
        } else {
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 25), NSAttributedStringKey.foregroundColor: UIColor.white]
        }
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        let backgroundImage = UIImage(named: "gradient_back")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        tableContent.delegate = self
        tableContent.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
