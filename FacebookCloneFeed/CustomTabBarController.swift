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
        feedNVC.title = "News feed"
        feedNVC.tabBarItem.image = UIImage(named: "feed")
        feedNVC.tabBarItem.selectedImage = UIImage(named: "feed")
        // Controller title
        feedController.title = "News feed"

        let friendsController = FriendsTableViewController()
        let friendsNVC = UINavigationController(rootViewController: friendsController)
        friendsController.title = "Friends Request"
        friendsController.tabBarItem.image = UIImage(named: "friends")

        let messengerController =  UIViewController()
        let messengerNVC = UINavigationController(rootViewController: messengerController)
        messengerController.title = "Messenger"
        messengerController.tabBarItem.image = UIImage(named: "feed")

        let notificationsController =  UIViewController()
        let notificationsNVC = UINavigationController(rootViewController: notificationsController)
        notificationsController.title = "Notifications"
        notificationsController.tabBarItem.image = UIImage(named: "feed")

        let moreController =  UIViewController()
        let moreNVC = UINavigationController(rootViewController: moreController)
        moreController.title = "More"
        moreController.tabBarItem.image = UIImage(named: "feed")

        let tabBarList = [feedNVC, friendsNVC, messengerNVC, notificationsNVC, moreNVC]
        viewControllers = tabBarList
    }

}



