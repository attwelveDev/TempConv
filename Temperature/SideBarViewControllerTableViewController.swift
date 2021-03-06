//
//  SideBarViewControllerTableViewController.swift
//  Temperature
//
//  Created by Aaron Nguyen on 5/10/16.
//  Copyright © 2016 Aaron Nguyen. All rights reserved.
//

import UIKit

protocol SideBarTableViewControllerDelegate {
    func sideBarControlDidSelectRow(_ indexPath: IndexPath)
}

class SideBarViewControllerTableViewController: UITableViewController {

    var delegate: SideBarTableViewControllerDelegate?
    var tableData: Array<String> = []
    
    // MARK: - Table view data source

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView = UITableView(frame: self.tableView.frame, style: .grouped)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "Cell")

        // Configure the cell...
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
            cell!.backgroundColor = UIColor.clear
            cell!.textLabel?.textColor = UIColor.white
            
            let selectedView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: cell!.frame.size.width, height: cell!.frame.size.height))
            selectedView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            
            cell!.selectedBackgroundView = selectedView
        }
        
        cell!.textLabel?.text = tableData[indexPath.row]
        
        
        return cell!
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45.0
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.sideBarControlDidSelectRow((indexPath as NSIndexPath) as IndexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
