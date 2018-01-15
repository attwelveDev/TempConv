//
//  TodayViewController.swift
//  TempSave
//
//  Created by Aaron Nguyen on 14/1/18.
//  Copyright © 2018 Aaron Nguyen. All rights reserved.
//

import UIKit
import NotificationCenter

class TemperatureCell: UITableViewCell {
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
}

class TodayViewController: UIViewController, NCWidgetProviding, UITableViewDataSource, UITableViewDelegate {
        
    @IBOutlet weak var tableContent: UITableView!
    
    var from = [String]()
    var to = [String]()
    
    @IBOutlet weak var zeroLabel: UILabel!
    
    let defaults = UserDefaults(suiteName: "group.com.Aaron-Nguyen.Temperature")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        
        tableContent.dataSource = self
        tableContent.delegate = self
        
        defaults?.synchronize()
        let fromValues = defaults?.stringArray(forKey: "fromValues") ?? [String]()
        let toValues = defaults?.stringArray(forKey: "toValues") ?? [String]()
        
        if fromValues.count > 0 && toValues.count > 0 {
        
            from = Array(fromValues.suffix(2))
            to = Array(toValues.suffix(2))
        
            tableContent.reloadData()

        }
        
        tableContent.separatorStyle = .none
        tableContent.isScrollEnabled = false
        
        if from.count == 0 || defaults == nil {
            tableContent.removeFromSuperview()
        } else {
            zeroLabel.removeFromSuperview()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return from.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TemperatureCell
        
        let fromName = from[indexPath.row]
        cell.fromLabel.text = fromName
        
        let toName = to[indexPath.row]
        cell.toLabel.text = toName
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
