//
//  RequestHeader.swift
//  FacebookCloneFeed
//
//  Created by Alan Casas on 2019-05-19.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

class RequestHeader: UITableViewHeaderFooterView {
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "FRIEND REQUEST"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = UIColor(white: 0.4, alpha: 1)
        return label
    }()

    let bottonBorderView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgbCustomColor(red: 229, green: 231, blue: 235)
        return view
    }()

    func setupViews(){
        addSubview(nameLabel)
        addSubview(bottonBorderView)
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: nameLabel)
        addConstraintsWithFormat(format: "V:|[v0][v1(0.5)]|", views: nameLabel, bottonBorderView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: bottonBorderView)
    }
}
