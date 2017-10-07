//
//  EnjoyPageViewController.swift
//  Temperature
//
//  Created by Aaron on 5/10/17.
//  Copyright © 2017 Aaron Nguyen. All rights reserved.
//

import UIKit

class EnjoyPageViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var doneButton: UIButton!
    
    @IBAction func doneAction(_ sender: Any) {
        if HelpPageViewController.isFirstTimeThroughTutorial == false {
            navigationController?.popViewController(animated: true)
        } else if HelpPageViewController.isFirstTimeThroughTutorial == true {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let ivc = storyboard.instantiateViewController(withIdentifier: "3")
            ivc.modalPresentationStyle = .custom
            ivc.modalTransitionStyle = .crossDissolve
            self.navigationController?.pushViewController(ivc, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.layer.cornerRadius = 10.0
        textView.clipsToBounds = true
        
        doneButton.layer.cornerRadius = doneButton.frame.height / 2
        
        // Do any additional setup after loading the view.
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
