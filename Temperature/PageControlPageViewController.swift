//
//  PageControlPageViewController.swift
//  Temperature
//
//  Created by Aaron on 18/9/17.
//  Copyright © 2017 Aaron Nguyen. All rights reserved.
//

import UIKit

class PageControlPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    lazy var viewControllerArray: [UIViewController] = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let page1 = storyboard.instantiateViewController(withIdentifier: "3")
        let page2 = storyboard.instantiateViewController(withIdentifier: "cToK")
        let page3 = storyboard.instantiateViewController(withIdentifier: "Fahrenheit")
        let page4 = storyboard.instantiateViewController(withIdentifier: "fToK")
        let page5 = storyboard.instantiateViewController(withIdentifier: "kToC")
        let page6 = storyboard.instantiateViewController(withIdentifier: "kToF")
        
        return [page1, page2, page3, page4, page5, page6]
        
    }()

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for view in self.view.subviews {
            if view is UIScrollView {
                view.frame = UIScreen.main.bounds
            } else if view is UIPageControl {
                view.backgroundColor = UIColor.clear
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        
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
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return viewControllerArray.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
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
