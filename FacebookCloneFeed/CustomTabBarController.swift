//
//  CustomTabBarController.swift
//  FacebookCloneFeed
//
//  Created by Alan Casas on 15/05/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate  {
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        
        let feedController = FeedCollectionViewController()
        let feedNVC = UINavigationController(rootViewController: feedController)
        //Navigation title
        feedController.title = "News feed"
        feedNVC.tabBarItem.image = UIImage(named: "feed")
        feedNVC.tabBarItem.selectedImage = UIImage(named: "feed")

        let friendsController = FriendsTableViewController()
        let friendsNVC = UINavigationController(rootViewController: friendsController)
        friendsController.title = "Friends Request"
        friendsNVC.tabBarItem.image = UIImage(named: "friends")

        let messengerController =  UIViewController()
        let messengerNVC = UINavigationController(rootViewController: messengerController)
        messengerController.title = "Messenger"
        messengerNVC.tabBarItem.image = UIImage(named: "feed")

        let notificationsController =  UIViewController()
        let notificationsNVC = UINavigationController(rootViewController: notificationsController)
        notificationsController.title = "Notifications"
        notificationsNVC.tabBarItem.image = UIImage(named: "feed")

        let moreController =  UIViewController()
        let moreNVC = UINavigationController(rootViewController: moreController)
        moreController.title = "More"
        moreNVC.tabBarItem.image = UIImage(named: "feed")

        let tabBarList = [feedNVC, friendsNVC, messengerNVC, notificationsNVC, moreNVC]
        viewControllers = tabBarList

        // to do opaque
        tabBar.isTranslucent = false

        let topBorder = CALayer()

        topBorder.frame = CGRect(x: 0, y: 0, width: 1000, height: 0.5)
        topBorder.backgroundColor = UIColor.rgbCustomColor(red: 229, green: 231, blue: 235).cgColor

        tabBar.layer.addSublayer(topBorder)
        tabBar.clipsToBounds = true

    }

}



