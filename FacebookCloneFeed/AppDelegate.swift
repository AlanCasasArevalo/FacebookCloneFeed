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
        window?.backgroundColor = UIColor.cyan

        let navigationVC = UINavigationController(rootViewController: UIViewController())

        window?.rootViewController = navigationVC

        return true
    }

}
