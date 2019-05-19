//
//  FriendsTableViewController.swift
//  FacebookCloneFeed
//
//  Created by Alan Casas on 15/05/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    let cellFriendsID = "cellFriendsID"
    let headerFriendsID = "headerFriendsID"

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Friend request"
        tableView.register(FriendsRequestCell.self, forCellReuseIdentifier: cellFriendsID)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellFriendsID, for: indexPath) as! FriendsRequestCell        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
