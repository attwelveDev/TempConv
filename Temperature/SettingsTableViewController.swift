//
//  SettingsTableViewController.swift
//  Temperature
//
//  Created by Aaron Nguyen on 10/12/16.
//  Copyright © 2016 Aaron Nguyen. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet var tableContent: UITableView!

    var cToFCell: UITableViewCell = UITableViewCell()
    var cToKCell: UITableViewCell = UITableViewCell()
    var fToCCell: UITableViewCell = UITableViewCell()
    var fToKCell: UITableViewCell = UITableViewCell()
    var kToCCell: UITableViewCell = UITableViewCell()
    var kToFCell: UITableViewCell = UITableViewCell()

    override func loadView() {
        super.loadView()
        
        let cToFCellValue = UserDefaults.standard
        if (cToFCellValue.value(forKey: "Value") != nil){
            cToFCell.textLabel?.text = cToFCellValue.value(forKey: "Value") as? String!
            if let output = cToFCell.textLabel?.text {
                cToFCell.textLabel?.text! = "\(output)"
            }
        } else {
            cToFCell.textLabel?.text = "Celsius to Fahrenheit ✓"
        }
        self.cToFCell.textLabel?.textColor = UIColor.white
        self.cToFCell.backgroundColor = UIColor.white
        self.cToFCell.accessoryType = UITableViewCell.AccessoryType.none
        
        let cToKCellValue = UserDefaults.standard
        if (cToKCellValue.value(forKey: "Value1") != nil){
            cToKCell.textLabel?.text = cToKCellValue.value(forKey: "Value1") as? String!
            if let output = cToKCell.textLabel?.text {
                cToKCell.textLabel?.text! = "\(output)"
            }
        } else {
            cToKCell.textLabel?.text = "Celsius to Kelvin"
        }
        self.cToKCell.textLabel?.textColor = UIColor.white
        self.cToKCell.backgroundColor = UIColor(white: 1, alpha: 0.5)
        self.cToKCell.accessoryType = UITableViewCell.AccessoryType.none
        
        let fToCCellValue = UserDefaults.standard
        if (fToCCellValue.value(forKey: "Value2") != nil){
            fToCCell.textLabel?.text = fToCCellValue.value(forKey: "Value2") as? String!
            if let output = fToCCell.textLabel?.text {
                fToCCell.textLabel?.text! = "\(output)"
            }
        } else {
            fToCCell.textLabel?.text = "Fahrenheit to Celsius"
        }
        self.fToCCell.textLabel?.textColor = UIColor.white
        self.fToCCell.backgroundColor = UIColor(white: 1, alpha: 0.5)
        self.fToCCell.accessoryType = UITableViewCell.AccessoryType.none
        
        let fToKCellValue = UserDefaults.standard
        if (fToKCellValue.value(forKey: "Value3") != nil){
            fToKCell.textLabel?.text = fToKCellValue.value(forKey: "Value3") as? String!
            if let output = fToKCell.textLabel?.text {
                fToKCell.textLabel?.text! = "\(output)"
            }
        } else {
            fToKCell.textLabel?.text = "Fahrenheit to Kelvin"
        }
        self.fToKCell.textLabel?.textColor = UIColor.white
        self.fToKCell.backgroundColor = UIColor(white: 1, alpha: 0.5)
        self.fToKCell.accessoryType = UITableViewCell.AccessoryType.none
        
        let kToCCellValue = UserDefaults.standard
        if (kToCCellValue.value(forKey: "Value4") != nil){
            kToCCell.textLabel?.text = kToCCellValue.value(forKey: "Value4") as? String!
            if let output = kToCCell.textLabel?.text {
                kToCCell.textLabel?.text! = "\(output)"
            }
        } else {
            kToCCell.textLabel?.text = "Kelvin to Celsius"
        }
        self.kToCCell.textLabel?.textColor = UIColor.white
        self.kToCCell.backgroundColor = UIColor(white: 1, alpha: 0.5)
        self.kToCCell.accessoryType = UITableViewCell.AccessoryType.none
        
        let kToFCellValue = UserDefaults.standard
        if (kToFCellValue.value(forKey: "Value5") != nil){
            kToFCell.textLabel?.text = kToFCellValue.value(forKey: "Value5") as? String!
            if let output = kToFCell.textLabel?.text {
                kToFCell.textLabel?.text! = "\(output)"
            }
        } else {
            kToFCell.textLabel?.text = "Kelvin to Fahrenheit"
        }
        self.kToFCell.textLabel?.textColor = UIColor.white
        self.kToFCell.backgroundColor = UIColor(white: 1, alpha: 0.5)
        self.kToFCell.accessoryType = UITableViewCell.AccessoryType.none
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section) {
            case 0: return 6
            default: fatalError("Unknown number of sections")
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch(indexPath.section) {
        case 0:
            switch(indexPath.row) {
            case 0: return self.cToFCell
            case 1: return self.cToKCell
            case 2: return self.fToCCell
            case 3: return self.fToKCell
            case 4: return self.kToCCell
            case 5: return self.kToFCell
            default: fatalError("Unknown row in section 0")
            }
        default: fatalError("Unknown section")
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch(section) {
        case 0: return "Launch with"
        default: fatalError("Unknown section")
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch(section) {
        case 0: return "Choose the conversion mode that the application will launch on by default. The effects take place after you quit this application or after a period of time following the changes."
        default: fatalError("Unknown section")
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        let footer: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        
        footer.textLabel?.textColor = UIColor.white
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
            cToFCell.textLabel?.text! = "Celsius to Fahrenheit ✓"
            cToKCell.textLabel?.text! = "Celsius to Kelvin"
            fToCCell.textLabel?.text! = "Fahrenheit to Celsius"
            fToKCell.textLabel?.text! = "Fahrenheit to Kelvin"
            kToCCell.textLabel?.text! = "Kelvin to Celsius"
            kToFCell.textLabel?.text! = "Kelvin to Fahrenheit"
            
            let defaults = UserDefaults.standard
            defaults.set("FirstViewController", forKey: "LaunchView")
            
        } else if (indexPath.section == 0 && indexPath.row == 1) {
            cToFCell.textLabel?.text! = "Celsius to Fahrenheit"
            cToKCell.textLabel?.text! = "Celsius to Kelvin ✓"
            fToCCell.textLabel?.text! = "Fahrenheit to Celsius"
            fToKCell.textLabel?.text! = "Fahrenheit to Kelvin"
            kToCCell.textLabel?.text! = "Kelvin to Celsius"
            kToFCell.textLabel?.text! = "Kelvin to Fahrenheit"
            
            let defaults = UserDefaults.standard
            defaults.set("CelsiusToKelvinViewController", forKey: "LaunchView")

        } else if (indexPath.section == 0 && indexPath.row == 2) {
            cToFCell.textLabel?.text! = "Celsius to Fahrenheit"
            cToKCell.textLabel?.text! = "Celsius to Kelvin"
            fToCCell.textLabel?.text! = "Fahrenheit to Celsius ✓"
            fToKCell.textLabel?.text! = "Fahrenheit to Kelvin"
            kToCCell.textLabel?.text! = "Kelvin to Celsius"
            kToFCell.textLabel?.text! = "Kelvin to Fahrenheit"
            
            let defaults = UserDefaults.standard
            defaults.set("FourthViewController", forKey: "LaunchView")
            
        } else if (indexPath.section == 0 && indexPath.row == 3) {
            cToFCell.textLabel?.text! = "Celsius to Fahrenheit"
            cToKCell.textLabel?.text! = "Celsius to Kelvin"
            fToCCell.textLabel?.text! = "Fahrenheit to Celsius"
            fToKCell.textLabel?.text! = "Fahrenheit to Kelvin ✓"
            kToCCell.textLabel?.text! = "Kelvin to Celsius"
            kToFCell.textLabel?.text! = "Kelvin to Fahrenheit"
            
            let defaults = UserDefaults.standard
            defaults.set("FahrenheitToKelvinViewController", forKey: "LaunchView")

        } else if (indexPath.section == 0 && indexPath.row == 4) {
            cToFCell.textLabel?.text! = "Celsius to Fahrenheit"
            cToKCell.textLabel?.text! = "Celsius to Kelvin"
            fToCCell.textLabel?.text! = "Fahrenheit to Celsius"
            fToKCell.textLabel?.text! = "Fahrenheit to Kelvin"
            kToCCell.textLabel?.text! = "Kelvin to Celsius ✓"
            kToFCell.textLabel?.text! = "Kelvin to Fahrenheit"
            
            let defaults = UserDefaults.standard
            defaults.set("KelvinToCelsiusViewController", forKey: "LaunchView")

        } else if (indexPath.section == 0 && indexPath.row == 5) {
            cToFCell.textLabel?.text! = "Celsius to Fahrenheit"
            cToKCell.textLabel?.text! = "Celsius to Kelvin"
            fToCCell.textLabel?.text! = "Fahrenheit to Celsius"
            fToKCell.textLabel?.text! = "Fahrenheit to Kelvin"
            kToCCell.textLabel?.text! = "Kelvin to Celsius"
            kToFCell.textLabel?.text! = "Kelvin to Fahrenheit ✓"
            
            let defaults = UserDefaults.standard
            defaults.set("KelvinToFahrenheitViewController", forKey: "LaunchView")

        }
        
        let cToFCellValue = UserDefaults.standard
        cToFCellValue.setValue(cToFCell.textLabel?.text!, forKey: "Value")
        cToFCellValue.synchronize()
        
        let cToKCellValue = UserDefaults.standard
        cToKCellValue.setValue(cToKCell.textLabel?.text!, forKey: "Value1")
        cToKCellValue.synchronize()
        
        let fToCCellValue = UserDefaults.standard
        fToCCellValue.setValue(fToCCell.textLabel?.text!, forKey: "Value2")
        fToCCellValue.synchronize()
        
        let fToKCellValue = UserDefaults.standard
        fToKCellValue.setValue(fToKCell.textLabel?.text!, forKey: "Value3")
        fToKCellValue.synchronize()
        
        let kToCCellValue = UserDefaults.standard
        kToCCellValue.setValue(kToCCell.textLabel?.text!, forKey: "Value4")
        kToCCellValue.synchronize()
        
        let kToFCellValue = UserDefaults.standard
        kToFCellValue.setValue(kToFCell.textLabel?.text!, forKey: "Value5")
        kToFCellValue.synchronize()
    
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "Settings"
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        }
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        let backgroundImage = UIImage(named: "gradient_back")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        tableContent.delegate = self
        tableContent.dataSource = self
        
        if tableContent.contentSize.height < tableContent.frame.size.height {
            tableContent.isScrollEnabled = false
        } else {
            tableContent.isScrollEnabled = true
        }
        
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
