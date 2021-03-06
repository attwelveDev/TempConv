//
//  CelsiusToKelvinViewController.swift
//  Temperature
//
//  Created by Aaron Nguyen on 4/12/16.
//  Copyright © 2016 Aaron Nguyen. All rights reserved.
//

import UIKit

class CelsiusToKelvinViewController: UIViewController, UIPickerViewDelegate, SideBarDelegate {
    
    var sideBar: SideBar = SideBar()
    var identity = "1"
    var identity2 = "2"
    var identity3 = "Fahrenheit"
    var identity4 = "About"
    var identity6 = "aboutTBV"
    var identity7 = "3"
    var identity8 = "kToC"
    
    @IBOutlet var conversionView: UIView!
    @IBOutlet var saveView: UIView!
    @IBOutlet var copyView: UIView!
    @IBOutlet weak var changeConversion: UIButton!
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
    
    let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffect.Style.regular))
    
    func animateIn() {
        if !UIAccessibility.isReduceTransparencyEnabled {
            blurEffectView.frame = self.view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            self.view.addSubview(blurEffectView)
            blurEffectView.alpha = 0
        }
        
        self.view.addSubview(self.conversionView)
        conversionView.center = self.view.center
        
        conversionView.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        conversionView.alpha = 0
        
        UIView.animate(withDuration: 0.2) {
            
            self.navigationController?.navigationBar.alpha = 0.000001
            
            self.blurEffectView.alpha = 1
            self.blurEffectView.transform = CGAffineTransform.identity
            
            self.conversionView.alpha = 1
            self.conversionView.transform = CGAffineTransform.identity
        }
    }
    func animateOut() {
        
        UIView.animate(withDuration: 0.2, animations: {
            self.conversionView.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
            self.conversionView.alpha = 0
            self.blurEffectView.alpha = 0
            
            self.navigationController?.navigationBar.alpha = 1
            
        }){(success: Bool) in
            
            self.conversionView.removeFromSuperview()
            self.blurEffectView.removeFromSuperview()
        }
    }
    
    func animateIn1() {
        if !UIAccessibility.isReduceTransparencyEnabled {
            blurEffectView.frame = self.view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            self.view.addSubview(blurEffectView)
            blurEffectView.alpha = 0
        }
        
        self.view.addSubview(copyView)
        copyView.center = self.view.center
        
        copyView.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        copyView.alpha = 0
        
        UIView.animate(withDuration: 0.2) {
            
            self.navigationController?.navigationBar.alpha = 0.000001
            
            self.blurEffectView.alpha = 1
            self.blurEffectView.transform = CGAffineTransform.identity
            
            self.copyView.alpha = 1
            self.copyView.transform = CGAffineTransform.identity
        }
    }
    func animateOut1() {
        
        UIView.animate(withDuration: 0.2, animations: {
            self.copyView.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
            self.copyView.alpha = 0
            self.blurEffectView.alpha = 0
            
            self.navigationController?.navigationBar.alpha = 1
            
        }){(success: Bool) in
            self.blurEffectView.removeFromSuperview()
            self.copyView.removeFromSuperview()
        }
    }
    
    func animateIn2() {
        if !UIAccessibility.isReduceTransparencyEnabled {
            blurEffectView.frame = self.view.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            self.view.addSubview(blurEffectView)
            blurEffectView.alpha = 0
        }
        
        self.view.addSubview(saveView)
        saveView.center = self.view.center
        
        saveView.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
        saveView.alpha = 0
        
        UIView.animate(withDuration: 0.2) {
            
            self.navigationController?.navigationBar.alpha = 0.000001
            
            self.blurEffectView.alpha = 1
            self.blurEffectView.transform = CGAffineTransform.identity
            
            self.saveView.alpha = 1
            self.saveView.transform = CGAffineTransform.identity
        }
    }
    func animateOut2() {
        UIView.animate(withDuration: 0.2, animations: {
            self.saveView.transform = CGAffineTransform.init(scaleX: 0.9, y: 0.9)
            self.saveView.alpha = 0
            self.blurEffectView.alpha = 0
            
            self.navigationController?.navigationBar.alpha = 1
            
        }){(success: Bool) in
            self.blurEffectView.removeFromSuperview()
            self.saveView.removeFromSuperview()
        }
    }
    
    @IBAction func kToC(_ sender: Any) {
        animateOut()
        let vcName = identity7
        let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
        self.navigationController?.pushViewController(viewController!, animated: false)
    }

    @IBOutlet var tempRange: TemperatureRange3!
    @IBOutlet weak var tempPicker: UIPickerView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBAction func reverse(_ sender: Any) {
        animateOut()
        reverseInstansiation()
    }
    
    func reverseInstansiation () {
        let vcName = identity8
        let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
        self.navigationController?.pushViewController(viewController!, animated: false)
    }
    
    //celsius to kelvin
    
    fileprivate let converter = cToKUnitConverter()
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let kelvinValue = tempRange.values[row]
        return "\(kelvinValue)°C"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        displayConvertedTemperatureForRow(row)
    }
    
    func displayConvertedTemperatureForRow(_ row: Int){
        let degreesCelsius = tempRange.values[row]
        
        tempLabel.text = "\(converter.degreesKelvin(degreesCelsius)) K"
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        label.text = "\(tempRange.values[row])°C"
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25)
        view.addSubview(label)
        
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "C° to K"
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        }
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        tempLabel.layer.cornerRadius = tempLabel.frame.height / 2
        tempLabel.clipsToBounds = true
        
        conversionView.layer.cornerRadius = 10.0
        copyView.layer.cornerRadius = 10.0
        saveView.layer.cornerRadius = 10.0
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        sideBar = SideBar(sourceView: self.view, menuItems: ["From F°", "From K", "Help", "TempSave", "Learn", "More"])
        sideBar.delegate = self
        
        
        leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(FirstViewController.handleSwipe))
        leftSwipe.direction = .left
        view.addGestureRecognizer(leftSwipe)
        
        leftSwipe.isEnabled = false
        
        rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(FirstViewController.handleSwipe))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        tempPicker.subviews[1].isHidden = true
        tempPicker.subviews[2].isHidden = true
    }
    
    var leftSwipe = UISwipeGestureRecognizer()
    var rightSwipe = UISwipeGestureRecognizer()
    
    @objc func handleSwipe() {
        directionEnabling()
        sideBarBool = !sideBarBool
    }
    
    func directionEnabling() {
        if sideBarBool == false {
            rightSwipe.isEnabled = false
            leftSwipe.isEnabled = true
        } else {
            rightSwipe.isEnabled = true
            leftSwipe.isEnabled = false
        }
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
        directionEnabling()
        sideBarBool = !sideBarBool
    }
    @IBOutlet weak var copyLabel: UILabel!
    @IBOutlet weak var okLabel: UIButton!
    @IBOutlet weak var cancelLabel: UIButton!
    @IBOutlet var longPress: UILongPressGestureRecognizer!
    @IBAction func longPressed(_ sender: Any) {
        let copyable = tempLabel.text!
        okLabel.setTitleColor(UIColor(red: 30/255.0, green: 175/255.0, blue: 249/255.0, alpha: 1.0), for: UIControl.State.normal)
        okLabel.setTitle("OK",for: .normal)
        okLabel.titleLabel?.font = UIFont.systemFont(ofSize: 18)
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
        okLabel.setTitleColor(UIColor.green, for: UIControl.State.normal)
        okLabel.setTitle("Success", for: .normal)
        okLabel.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
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
        let from = "\(tempPicker.selectedRow(inComponent: 0) + -273)°C"
        okLabel1.setTitleColor(UIColor(red: 30/255.0, green: 175/255.0, blue: 249/255.0, alpha: 1.0), for: UIControl.State.normal)
        okLabel1.setTitle("OK",for: .normal)
        okLabel1.titleLabel?.font = UIFont.systemFont(ofSize: 18)
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
        let from = "\(tempPicker.selectedRow(inComponent: 0) + -273)°C"
        let to = tempLabel.text!
        SavingTableViewController.from.append(from)
        SavingTableViewController.to.append(to)
        let defaults = UserDefaults.standard
        defaults.set(SavingTableViewController.from, forKey: "fromValues")
        defaults.set(SavingTableViewController.to, forKey: "toValues")
        UserDefaults(suiteName: "group.com.Aaron-Nguyen.Temperature")?.set(defaults.object(forKey: "fromValues"), forKey: "fromValues")
        UserDefaults(suiteName: "group.com.Aaron-Nguyen.Temperature")?.set(defaults.object(forKey: "toValues"), forKey: "toValues")
        saveLabel.isHidden = true
        cancelLabel1.isHidden = true
        okLabel1.setTitleColor(UIColor.green, for: UIControl.State.normal)
        okLabel1.setTitle("Success", for: .normal)
        okLabel1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
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
            let ivc = storyboard.instantiateViewController(withIdentifier: "helpFake")
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
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let ivc = storyboard.instantiateViewController(withIdentifier: identity2)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
