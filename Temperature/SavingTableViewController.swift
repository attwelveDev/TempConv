//
//  SavingTableViewController.swift
//  Temperature
//
//  Created by Aaron Nguyen on 12/8/17.
//  Copyright © 2017 Aaron Nguyen. All rights reserved.
//

import UIKit

class DataCell: UITableViewCell {
    
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!

}

class SavingTableViewController: UITableViewController {

    static var from = [String]()
    static var to = [String]()

    let defaults = UserDefaults.standard
    
    @IBOutlet var zeroView: UIView!
    
    @IBAction func okAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        self.navigationController?.navigationBar.alpha = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SavingTableViewController.from = defaults.stringArray(forKey: "fromValues") ?? [String]()
        SavingTableViewController.to = defaults.stringArray(forKey: "toValues") ?? [String]()
        
        UserDefaults(suiteName: "group.com.Aaron-Nguyen.Temperature")?.set(defaults.object(forKey: "fromValues"), forKey: "fromValues")
        UserDefaults(suiteName: "group.com.Aaron-Nguyen.Temperature")?.set(defaults.object(forKey: "toValues"), forKey: "toValues")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.navigationItem.title = "TempSave"
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
        
        if SavingTableViewController.from.count == 0 {
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 000000000000.1, execute: {
                self.animateIn()
            })

        }
        
        if tableView.contentSize.height < tableView.frame.size.height {
            tableView.isScrollEnabled = false
        } else {
            tableView.isScrollEnabled = true
        }
        
        zeroView.layer.cornerRadius = 10.0
        zeroView.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return SavingTableViewController.from.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell", for: indexPath) as! DataCell

        let fromName = SavingTableViewController.from[indexPath.row]
        cell.fromLabel?.text = fromName
        
        let toName = SavingTableViewController.to[indexPath.row]
        cell.toLabel?.text = toName
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            SavingTableViewController.from.remove(at: indexPath.row)
            SavingTableViewController.to.remove(at: indexPath.row)
            defaults.set(SavingTableViewController.from, forKey: "fromValues")
            defaults.set(SavingTableViewController.to, forKey: "toValues")
            UserDefaults(suiteName: "group.com.Aaron-Nguyen.Temperature")?.set(defaults.object(forKey: "fromValues"), forKey: "fromValues")
            UserDefaults(suiteName: "group.com.Aaron-Nguyen.Temperature")?.set(defaults.object(forKey: "toValues"), forKey: "toValues")
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            if SavingTableViewController.from.count == 0 {
                animateIn()
            }
        }
    }
    
    let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.regular))
    
    func animateIn() {
        if !UIAccessibilityIsReduceTransparencyEnabled() {
            blurEffectView.frame = self.view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            self.view.addSubview(blurEffectView)
            blurEffectView.alpha = 0

        }
        
        self.view.addSubview(self.zeroView)
        
        zeroView.center = CGPoint(x: view.center.x , y: view.center.y - (navigationController?.navigationBar.frame.height)!)
        
        zeroView.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        zeroView.alpha = 0
        
        UIView.animate(withDuration: 0.2) {
     
            self.blurEffectView.alpha = 1
            self.blurEffectView.transform = CGAffineTransform.identity
            
            self.zeroView.alpha = 1
            self.zeroView.transform = CGAffineTransform.identity
        }
    }

}
