//
//  AppDelegate.swift
//  Memes
//
//  Created by IT on 9/22/16.
//  Copyright © 2016 z0s. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var memes = [Meme]()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        
        let vc = MemesCollectionViewController()
         
        let tabBar = UITabBarController()
        
        let rootVC = MemesTableViewController()
        let nav1 = UINavigationController(rootViewController: rootVC)
        let nav2 = UINavigationController(rootViewController: vc)
        
        tabBar.setViewControllers([nav1, nav2], animated: true)
        
        
//        window?.rootViewController = nav1
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docsDirectory = paths[0]
        let fileName = docsDirectory.appendingPathComponent("test.png")
        
        for _ in 0..<5 {
            if let memedImage = UIImage(contentsOfFile: fileName.path) {
                let meme = Meme(topText: "Test Top", bottomText: "Test Bot", image: memedImage, memedImage: memedImage)
                memes.append(meme)
            }
        }
    
        return true
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

