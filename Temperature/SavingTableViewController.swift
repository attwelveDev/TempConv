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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SavingTableViewController.from = defaults.stringArray(forKey: "fromValues") ?? [String]()
        SavingTableViewController.to = defaults.stringArray(forKey: "toValues") ?? [String]()
        
        print(SavingTableViewController.from)
        print(SavingTableViewController.to)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.navigationItem.title = "Saved"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        let backgroundImage = UIImage(named: "gradient_back")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
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
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }

}
