//
//  HelpViewController.swift
//  Temperature
//
//  Created by Aaron Nguyen on 30/9/16.
//  Copyright © 2016 Aaron Nguyen. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var slideshow: UIScrollView!
    @IBOutlet weak var pages: UIPageControl!
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Help"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.view.backgroundColor = UIColor.cyan
        
        slideshow.frame = view.frame
        
        imageArray = [#imageLiteral(resourceName: "help2_0"), #imageLiteral(resourceName: "help2_1"), #imageLiteral(resourceName: "help2_2"), #imageLiteral(resourceName: "help2_3"), #imageLiteral(resourceName: "help2_save"), #imageLiteral(resourceName: "help2_4"), #imageLiteral(resourceName: "help2_5"), #imageLiteral(resourceName: "help2_7")]
        
        for i in 0..<imageArray.count{
            
            let imageView = UIImageView()
            imageView.image = imageArray[i]
            imageView.contentMode = .scaleAspectFit
            let xPosition = self.view.frame.width * CGFloat (i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: self.slideshow.frame.width, height: self.slideshow.frame.height)
            
            slideshow.contentSize.width = slideshow.frame.width * CGFloat(i + 1)
            slideshow.addSubview(imageView)
            
            slideshow.delegate = self
        
        // Do any additional setup after loading the view.
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        pages.currentPage = Int(page)
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
