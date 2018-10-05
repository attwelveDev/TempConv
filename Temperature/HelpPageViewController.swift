//
//  HelpPageViewController.swift
//  Temperature
//
//  Created by Aaron on 4/10/17.
//  Copyright © 2017 Aaron Nguyen. All rights reserved.
//

import UIKit

class HelpPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    static var isFirstTimeThroughTutorial = false
    
    lazy var viewControllerArray: [UIViewController] = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let welcomePage = storyboard.instantiateViewController(withIdentifier: "welcome")
        let page1 = storyboard.instantiateViewController(withIdentifier: "convert")
        let page2 = storyboard.instantiateViewController(withIdentifier: "change")
        let page3 = storyboard.instantiateViewController(withIdentifier: "copy")
        let page4 = storyboard.instantiateViewController(withIdentifier: "saving")
        let page5 = storyboard.instantiateViewController(withIdentifier: "access")
        let page6 = storyboard.instantiateViewController(withIdentifier: "enjoy")

        let defaults = UserDefaults.standard
        if defaults.object(forKey: "isFirstTimeLaunched") == nil {
            defaults.set("No", forKey:"isFirstTimeLaunched")
            defaults.synchronize()
            
            HelpPageViewController.isFirstTimeThroughTutorial = true
            
            let newBackButton = UIBarButtonItem(title: "Skip", style: UIBarButtonItem.Style.plain, target: self, action: #selector(skip(sender:)))
            newBackButton.image = nil
            self.navigationItem.leftBarButtonItem = newBackButton
            newBackButton.tintColor = .white
            
            return [welcomePage, page1, page2, page3, page4, page5, page6]
            
        } else {
            
            return [page1, page2, page3, page4, page5, page6]
            
        }
        
    }()
    
    @objc func skip(sender: UIBarButtonItem) {
        
        HelpPageViewController.isFirstTimeThroughTutorial = false
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let ivc = storyboard.instantiateViewController(withIdentifier: "3")
        ivc.modalPresentationStyle = .custom
        ivc.modalTransitionStyle = .crossDissolve
        self.navigationController?.pushViewController(ivc, animated: true)
        
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        for view in self.view.subviews {
//            if view is UIScrollView {
//                view.frame = UIScreen.main.bounds
//            } else if view is UIPageControl {
//                view.backgroundColor = UIColor.clear
//            }
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        self.navigationItem.title = "Help"
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        }
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.tintColor = .white
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()

        
        
        if let firstViewController = viewControllerArray.first {
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = viewControllerArray.index(of: viewController) else {return nil}
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {return nil}
        
        guard viewControllerArray.count > previousIndex else {return nil}
        
        return viewControllerArray[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = viewControllerArray.index(of: viewController) else {return nil}
        
        let nextIndex = viewControllerIndex + 1
        
        guard viewControllerArray.count != nextIndex else {return nil}
        
        guard viewControllerArray.count > nextIndex else {return nil}
        
        return viewControllerArray[nextIndex]
    }
    
//    func presentationCount(for pageViewController: UIPageViewController) -> Int {
//        return viewControllerArray.count
//    }
//    
//    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
//        return 0
//    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

