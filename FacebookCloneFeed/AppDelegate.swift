//
//  AppDelegate.swift
//  FacebookCloneFeed
//
//  Created by Alan Casas on 2019-05-12.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit


@UIApplicationMain
 class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        setupUI()

        application.statusBarStyle = .lightContent
        window?.rootViewController = CustomTabBarController()        
        return true
    }

    func setupUI () {
        UINavigationBar.appearance().barTintColor = UIColor(red: 51/255, green: 90/255, blue: 149/255, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}























































