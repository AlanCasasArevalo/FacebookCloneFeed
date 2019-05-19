//
//  CustomTabBarController.swift
//  FacebookCloneFeed
//
//  Created by Alan Casas on 15/05/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let feedController = FeedCollectionViewController()
        let feedNVC = UINavigationController(rootViewController: feedController)
        //UIApplicationShortcutIcon.IconType.love
        feedNVC.title = "News feed"
        feedNVC.tabBarItem.image = UIImage(named: "feed")
        
        let friendsController = FriendsTableViewController()
        let friendsNVC = UINavigationController(rootViewController: friendsController)
        friendsNVC.title = "Friend request"
        friendsNVC.tabBarItem.image = UIImage(named: "friends")
        
        viewControllers = [friendsController, feedNVC]
    }
    
}



