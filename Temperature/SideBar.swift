//
//  SideBar.swift
//  Temperature
//
//  Created by Aaron Nguyen on 5/10/16.
//  Copyright © 2016 Aaron Nguyen. All rights reserved.
//

import UIKit

@objc protocol SideBarDelegate {
    func sideBarDidSelectButtonAtIndex(_ index: Int)
    @objc optional func sideBarWillClose()
    @objc optional func sideBarWillOpen()
}

class SideBar: NSObject, SideBarTableViewControllerDelegate {

    let barWidth: CGFloat = 175.0
    let sideBarTableViewTopInset: CGFloat = 100.0
    let sideBarContainerView: UIView = UIView()
    let sideBarTableViewController: SideBarViewControllerTableViewController = SideBarViewControllerTableViewController()
    var originView: UIView!
    
    var animator: UIDynamicAnimator!
    var delegate: SideBarDelegate?
    var isSideBarOpen: Bool = false
    
    override init () {
        super.init()
    }
    
    init(sourceView: UIView, menuItems: Array<String>){
        super.init()
        
        originView = sourceView
        sideBarTableViewController.tableData = menuItems
        
        setupSideBar()
        
        animator = UIDynamicAnimator(referenceView: originView)
        
        let showGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(SideBar.handleSwipe(_:)))
        showGestureRecognizer.direction = UISwipeGestureRecognizer.Direction.right
        originView.addGestureRecognizer(showGestureRecognizer)
       
        let hideGestureRecognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(SideBar.handleSwipe(_:)))
        hideGestureRecognizer.direction = UISwipeGestureRecognizer.Direction.left
        originView.addGestureRecognizer(hideGestureRecognizer)
        
    }
    
    func setupSideBar() {
        
        sideBarContainerView.frame = CGRect(x: -barWidth - 1, y: originView.frame.origin.y, width: barWidth, height: originView.frame.size.height)
        sideBarContainerView.backgroundColor = UIColor.clear
        sideBarContainerView.clipsToBounds = false
        
        originView.addSubview(sideBarContainerView)
        
        let blurView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffect.Style.light))
        blurView.frame = sideBarContainerView.bounds
        sideBarContainerView.addSubview(blurView)
        
        sideBarTableViewController.delegate = self
        sideBarTableViewController.tableView.frame = sideBarContainerView.bounds
        sideBarTableViewController.tableView.clipsToBounds = false
        sideBarTableViewController.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        sideBarTableViewController.tableView.backgroundColor = UIColor.clear
        sideBarTableViewController.tableView.contentInset = UIEdgeInsets.init(top: sideBarTableViewTopInset, left: 0, bottom: 0, right: 0)
        sideBarTableViewController.tableView.isScrollEnabled = false
        
        sideBarTableViewController.tableView.reloadData()
        
        sideBarContainerView.addSubview(sideBarTableViewController.tableView)
        
    }
    
    @objc func handleSwipe(_ recgnizer: UISwipeGestureRecognizer) {
        if recgnizer.direction == UISwipeGestureRecognizer.Direction.left {
            showSideBar(false)
            delegate?.sideBarWillClose?()
        } else {
            showSideBar(true)
            delegate?.sideBarWillOpen?()
        }
        
    }
    
    func showSideBar(_ shouldOpen: Bool) {
        
        animator.removeAllBehaviors()
        isSideBarOpen = shouldOpen
        
        let gravityX: CGFloat = (shouldOpen) ? 0.5 : -0.5
        let magnitude: CGFloat = (shouldOpen) ? 10 : -10
        let boundary: CGFloat = (shouldOpen) ? barWidth : -barWidth - 1
        
        let gravityBehavior:UIGravityBehavior = UIGravityBehavior(items: [sideBarContainerView])
        gravityBehavior.gravityDirection = CGVector(dx: gravityX, dy: 0)
        animator.addBehavior(gravityBehavior)
        
        let collisionBehavior:UICollisionBehavior = UICollisionBehavior(items: [sideBarContainerView])
        collisionBehavior.addBoundary(withIdentifier: "sideBarBoundary" as NSCopying, from: CGPoint(x: boundary, y: 20), to: CGPoint(x: boundary, y: originView.frame.size.height))
        animator.addBehavior(collisionBehavior)
        
        let pushBehavior:UIPushBehavior = UIPushBehavior(items: [sideBarContainerView], mode: UIPushBehavior.Mode.instantaneous)
        pushBehavior.magnitude = magnitude
        animator.addBehavior(pushBehavior)
        
        
        let sideBarBehavior:UIDynamicItemBehavior = UIDynamicItemBehavior(items: [sideBarContainerView])
        sideBarBehavior.elasticity = 0.1
        animator.addBehavior(sideBarBehavior)
        
    }
    
    func sideBarControlDidSelectRow(_ indexPath: IndexPath) {
        
        delegate?.sideBarDidSelectButtonAtIndex(indexPath.row)
        
    }
    
}
