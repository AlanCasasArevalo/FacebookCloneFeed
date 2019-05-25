//
//  FriendsTableViewController.swift
//  FacebookCloneFeed
//
//  Created by Alan Casas on 15/05/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

let cellFriendsID = "cellFriendsID"
let headerFriendsID = "headerFriendsID"

class FriendsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerTable()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }

    func registerTable() {
        tableView.register(FriendsRequestCell.self, forCellReuseIdentifier: cellFriendsID)
        tableView.register(RequestHeader.self, forHeaderFooterViewReuseIdentifier: headerFriendsID)
    }

    func setupUI (){
        self.title = "Friends Request"
        self.tabBarItem.selectedImage = UIImage(named: "friends")
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellFriendsID, for: indexPath) as! FriendsRequestCell        

        if indexPath.row % 3 == 0 {
            cell.nameLabel.text = "Beth"
            cell.profileImageView.image = UIImage(named: "Beth")
        } else if indexPath.row % 3 == 1 {
            cell.nameLabel.text = "Lang"
            cell.profileImageView.image = UIImage(named: "Lang")
        } else {
            cell.nameLabel.text = "Ahmed"
            cell.profileImageView.image = UIImage(named: "Ahmed")
        }

        cell.imageView?.backgroundColor = UIColor.black
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerFriendsID) as! RequestHeader
        if section == 0 {
            header.nameLabel.text = "FRIENDS REQUEST"
        } else {
            header.nameLabel.text = "PEOPLE YOU MAY KNOW"
        }

        return header
    }
}
