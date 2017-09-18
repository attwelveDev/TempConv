//
//  AppDelegate.swift
//  Temperature
//
//  Created by Aaron Nguyen on 27/9/16.
//  Copyright © 2016 Aaron Nguyen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
        }
        
        let defaults = UserDefaults.standard
        if let launchview = defaults.string(forKey: "LaunchView")
        {
            if launchview == "FirstViewController" {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
                let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let cToFVC = mainStoryboard.instantiateViewController(withIdentifier: "cToFNav") as! UINavigationController
                appDelegate.window?.rootViewController = cToFVC
                appDelegate.window?.makeKeyAndVisible()
            } else if launchview == "CelsiusToKelvinViewController" {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
                let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let cToKVC = mainStoryboard.instantiateViewController(withIdentifier: "cToKNav") as! UINavigationController
                appDelegate.window?.rootViewController = cToKVC
                appDelegate.window?.makeKeyAndVisible()
            } else if launchview == "FourthViewController" {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
                let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let fToCVC = mainStoryboard.instantiateViewController(withIdentifier: "fToCNav") as! UINavigationController
                appDelegate.window?.rootViewController = fToCVC
                appDelegate.window?.makeKeyAndVisible()
            } else if launchview == "FahrenheitToKelvinViewController" {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
                let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let fToKVC = mainStoryboard.instantiateViewController(withIdentifier: "fToKNav") as! UINavigationController
                appDelegate.window?.rootViewController = fToKVC
                appDelegate.window?.makeKeyAndVisible()
            } else if launchview == "KelvinToCelsiusViewController" {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
                let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let kToCVC = mainStoryboard.instantiateViewController(withIdentifier: "kToCNav") as! UINavigationController
                appDelegate.window?.rootViewController = kToCVC
                appDelegate.window?.makeKeyAndVisible()
            } else if launchview == "KelvinToFahrenheitViewController" {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
                let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let kToFVC = mainStoryboard.instantiateViewController(withIdentifier: "kToFNav") as! UINavigationController
                appDelegate.window?.rootViewController = kToFVC
                appDelegate.window?.makeKeyAndVisible()
            }
        }
        
        // NOTICE - W.I.P.
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let viewController = storyboard.instantiateViewController(withIdentifier: "tutorial") as! UINavigationController
//        self.window?.rootViewController = viewController
//        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        self.handleShortcutItem(shortcutItem)
        completionHandler(true)
    }
    
    func handleShortcutItem(_ shortcutItem: UIApplicationShortcutItem){
        switch shortcutItem.type {
            case "com.Aaron-Nguyen.Temperature":
            self.presentFirstViewController()
            case "com.Aaron-Nguyen.Temperature2":
            self.presentFourthViewController()
            case "com.Aaron-Nguyen.Temperature3":
            self.presentKelvinToFahrenheitViewController()
        default: break
        }
    }
    
    func presentFirstViewController(){
        guard let navigationController = window?.rootViewController as? UINavigationController else {return}
        
        let identifier = "3"
        let firstViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
        
        navigationController.pushViewController(firstViewController, animated: false)
    }
    
    func presentFourthViewController(){
        guard let navigationController = window?.rootViewController as? UINavigationController else {return}
        
        let identifier = "Fahrenheit"
        let fourthViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
        
        navigationController.pushViewController(fourthViewController, animated: false)
    }
    
    func presentKelvinToFahrenheitViewController(){
        guard let navigationController = window?.rootViewController as? UINavigationController else {return}
        
        let identifier = "kToC"
        let kelvinToFahrenheitViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
        
        navigationController.pushViewController(kelvinToFahrenheitViewController, animated: false)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

