//
//  ViewController.swift
//  Temperature
//
//  Created by Aaron Nguyen on 27/9/16.
//  Copyright © 2016 Aaron Nguyen. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDelegate, SideBarDelegate {

    // declarations
    
    var sideBar: SideBar = SideBar()
    var identity = "1"
    var identity2 = "2"
    var identity3 = "Fahrenheit"
    var identity4 = "About"
    var identity5 = "WidgetHelp"
    var identity6 = "aboutTBV"
    var identity7 = "cToK"
    var identity8 = "kToC"
    
    // add views
    
    @IBOutlet weak var background: UIImageView!
    var effect: UIVisualEffect!
    @IBOutlet var conversionView: UIView!
    @IBOutlet var saveView: UIView!
    @IBOutlet var copyView: UIView!
    @IBOutlet weak var changeConversion: UIButton!
    var visualEffectView: UIVisualEffectView!
    @IBAction func changeConversion(_ sender: Any) {
        tempLabel.isHidden = true
        changeConversion.isUserInteractionEnabled = false
        tempPicker.isUserInteractionEnabled = false
        animateIn()
    }
    @IBAction func dismissView(_ sender: Any) {
        tempLabel.isHidden = false
        changeConversion.isUserInteractionEnabled = true
        tempPicker.isUserInteractionEnabled = true
        animateOut()
    }
    func animateIn() {
        self.view.addSubview(conversionView)
        conversionView.center = self.view.center
        
        conversionView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        conversionView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.visualEffectView?.effect = self.effect
            self.conversionView.alpha = 1
            self.conversionView.transform = CGAffineTransform.identity
        }

    }
    func animateOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.conversionView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.conversionView.alpha = 0
            
            self.visualEffectView?.effect = nil
            
        }){(success: Bool) in
            self.conversionView.removeFromSuperview()
        }
    }
    
    func animateIn1() {
        self.view.addSubview(copyView)
        copyView.center = self.view.center
        
        copyView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        copyView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.visualEffectView?.effect = self.effect
            self.copyView.alpha = 1
            self.copyView.transform = CGAffineTransform.identity
        }
    }
    func animateOut1() {
        UIView.animate(withDuration: 0.3, animations: {
            self.copyView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.copyView.alpha = 0
            
            self.visualEffectView?.effect = nil
            
        }){(success: Bool) in
            self.copyView.removeFromSuperview()
        }
    }
    
    func animateIn2() {
        self.view.addSubview(saveView)
        saveView.center = self.view.center
        
        saveView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        saveView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.visualEffectView?.effect = self.effect
            self.saveView.alpha = 1
            self.saveView.transform = CGAffineTransform.identity
        }
    }
    func animateOut2() {
        UIView.animate(withDuration: 0.3, animations: {
            self.saveView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.saveView.alpha = 0
            
            self.visualEffectView?.effect = nil
            
        }){(success: Bool) in
            self.saveView.removeFromSuperview()
        }
    }

    @IBAction func cToK(_ sender: Any) {
        tempLabel.isHidden = false
        animateOut()
        let vcName = identity7
        let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
        self.navigationController?.pushViewController(viewController!, animated: false)
    }
    @IBOutlet var tempRange: TemperatureRange!
    @IBOutlet weak var tempPicker: UIPickerView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBAction func helpBTN(_ sender: AnyObject) {
        
        let vcName = identity
        let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
        self.navigationController?.pushViewController(viewController!, animated: true)
        
    }
    
    @IBAction func reverse(_ sender: Any) {
        animateOut()
        let delayInSeconds = 0.3
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
            self.tempLabel.isHidden = false
            self.reverseInstansiation()
        }
    }
    
    func reverseInstansiation () {
        let vcName = identity3
        let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
        self.navigationController?.pushViewController(viewController!, animated: false)
    }
    
    //celsius to fahrenheit
    
    fileprivate let converter = UnitConverter()

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let celsiusValue = tempRange.values[row]
        return "\(celsiusValue)°C"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        displayConvertedTemperatureForRow(row)
    }
    
    func displayConvertedTemperatureForRow(_ row: Int){
        let degreesCelsius = tempRange.values[row]
        
        tempLabel.text = "\(converter.degreesFahrenheit(degreesCelsius))°F"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Celsius to Fahrenheit"
        navigationController?.navigationBar.barTintColor = UIColor(red:0.00, green:0.42, blue:0.98, alpha:1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        tempLabel.layer.cornerRadius = 5.0
        tempLabel.clipsToBounds = true
        
        effect = visualEffectView?.effect
        visualEffectView?.effect = nil
        
        conversionView.layer.cornerRadius = 5.0
        copyView.layer.cornerRadius = 5.0
        saveView.layer.cornerRadius = 5.0
        
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        sideBar = SideBar(sourceView: self.view, menuItems: ["From F°", "From K", "Saved", "Learn", "Add Widget", "More"])
        sideBar.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
        
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

  
    
    // copy mechanics
    
    @IBOutlet weak var copyLabel: UILabel!
    @IBOutlet weak var okLabel: UIButton!
    @IBOutlet weak var cancelLabel: UIButton!
    @IBOutlet var longPress: UILongPressGestureRecognizer!
    @IBAction func longPressed(_ sender: Any) {
        let copyable = tempLabel.text!
        okLabel.setTitleColor(UIColor(red: 30/255.0, green: 175/255.0, blue: 249/255.0, alpha: 1.0), for: UIControlState.normal)
        okLabel.setTitle("OK",for: .normal)
        okLabel.isUserInteractionEnabled = true
        copyLabel.isHidden = false
        cancelLabel.isHidden = false
        copyLabel.text = "Copy '\(copyable)'?"
        tempLabel.isHidden = true
        longPress.isEnabled = false
        copyLabel.textColor = UIColor.white
        tempLabel.isUserInteractionEnabled = false
        changeConversion.isUserInteractionEnabled = false
        tempPicker.isUserInteractionEnabled = false
        animateIn1()
    }
    @IBAction func dismissCopyView(_ sender: Any) {
        tempLabel.isHidden = false
        longPress.isEnabled = true
        tempLabel.isUserInteractionEnabled = true
        changeConversion.isUserInteractionEnabled = true
        tempPicker.isUserInteractionEnabled = true
        animateOut1()
    }
    @IBAction func copyAction(_ sender: Any) {
        let copyable = tempLabel.text!
        UIPasteboard.general.string = "\(copyable)"
        copyLabel.text = "Copy \(copyable)?"
        copyLabel.isHidden = true
        cancelLabel.isHidden = true
        okLabel.setTitleColor(UIColor.green, for: UIControlState.normal)
        okLabel.setTitle("Success", for: .normal)
        okLabel.isUserInteractionEnabled = false
        let delayInSeconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
            self.autoDismissView()
        }
    }
    func autoDismissView() {
        tempLabel.isHidden = false
        longPress.isEnabled = true
        tempLabel.isUserInteractionEnabled = true
        changeConversion.isUserInteractionEnabled = true
        tempPicker.isUserInteractionEnabled = true
        animateOut1()
    }
    
    // save mechanics
    
    @IBOutlet weak var saveLabel: UILabel!
    @IBOutlet weak var okLabel1: UIButton!
    @IBOutlet weak var cancelLabel1: UIButton!
    @IBOutlet var doubleTap: UITapGestureRecognizer!
    @IBAction func doubleTapped(_ sender: Any) {
        let to = tempLabel.text!
        let from = "\(tempPicker.selectedRow(inComponent: 0) + -100)°C"
        okLabel1.setTitleColor(UIColor(red: 30/255.0, green: 175/255.0, blue: 249/255.0, alpha: 1.0), for: UIControlState.normal)
        okLabel1.setTitle("OK",for: .normal)
        okLabel1.isUserInteractionEnabled = true
        saveLabel.isHidden = false
        cancelLabel1.isHidden = false
        saveLabel.text = "Save '\(from) to \(to)'?"
        tempLabel.isHidden = true
        doubleTap.isEnabled = false
        saveLabel.textColor = UIColor.white
        tempLabel.isUserInteractionEnabled = false
        changeConversion.isUserInteractionEnabled = false
        tempPicker.isUserInteractionEnabled = false
        animateIn2()
    }
    @IBAction func dismissSaveView(_ sender: Any) {
        tempLabel.isHidden = false
        doubleTap.isEnabled = true
        tempLabel.isUserInteractionEnabled = true
        changeConversion.isUserInteractionEnabled = true
        tempPicker.isUserInteractionEnabled = true
        animateOut2()
    }
    @IBAction func saveAction(_ sender: Any) {
        let from = "\(tempPicker.selectedRow(inComponent: 0) + -100)°C"
        let to = tempLabel.text!
        SavingTableViewController.from.append(from)
        SavingTableViewController.to.append(to)
        let defaults = UserDefaults.standard
        defaults.set(SavingTableViewController.from, forKey: "fromValues")
        defaults.set(SavingTableViewController.to, forKey: "toValues")
        saveLabel.isHidden = true
        cancelLabel1.isHidden = true
        okLabel1.setTitleColor(UIColor.green, for: UIControlState.normal)
        okLabel1.setTitle("Success", for: .normal)
        okLabel1.isUserInteractionEnabled = false
        let delayInSeconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
            self.autoDismissView1()
        }
        
    }
    func autoDismissView1() {
        tempLabel.isHidden = false
        doubleTap.isEnabled = true
        tempLabel.isUserInteractionEnabled = true
        changeConversion.isUserInteractionEnabled = true
        tempPicker.isUserInteractionEnabled = true
        animateOut2()
    }

    // sidebar
    
    func sideBarDidSelectButtonAtIndex(_ index: Int) {
        if index == 0 {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let ivc = storyboard.instantiateViewController(withIdentifier: identity3)
            ivc.modalPresentationStyle = .custom
            ivc.modalTransitionStyle = .crossDissolve
            self.navigationController?.pushViewController(ivc, animated: true)

        } else if index == 1 {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let ivc = storyboard.instantiateViewController(withIdentifier: identity8)
            ivc.modalPresentationStyle = .custom
            ivc.modalTransitionStyle = .crossDissolve
            self.navigationController?.pushViewController(ivc, animated: true)
            
        } else if index == 2 {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let ivc = storyboard.instantiateViewController(withIdentifier: "save")
            ivc.modalPresentationStyle = .custom
            ivc.modalTransitionStyle = .crossDissolve
            self.navigationController?.pushViewController(ivc, animated: true)
            
        } else if index == 3 {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let ivc = storyboard.instantiateViewController(withIdentifier: identity2)
            ivc.modalPresentationStyle = .custom
            ivc.modalTransitionStyle = .crossDissolve
            self.navigationController?.pushViewController(ivc, animated: true)
            
        } else if index == 4 {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let ivc = storyboard.instantiateViewController(withIdentifier: identity5)
            ivc.modalPresentationStyle = .custom
            ivc.modalTransitionStyle = .crossDissolve
            self.navigationController?.pushViewController(ivc, animated: true)

        } else if index == 5 {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let ivc = storyboard.instantiateViewController(withIdentifier: identity6)
            ivc.modalPresentationStyle = .custom
            ivc.modalTransitionStyle = .crossDissolve
            self.navigationController?.pushViewController(ivc, animated: true)
            
        }
    }
}

