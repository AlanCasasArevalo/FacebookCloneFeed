//
//  FriendsRequestCell.swift
//  FacebookCloneFeed
//
//  Created by Alan Casas on 15/05/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit


class FriendsRequestCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupFriendsViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "Beth")
        imageView.backgroundColor = UIColor.blue
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "_Beth"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    let buttonsView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.green
        return view
    }()

    let confirmButton:UIButton = {
        let button = UIButton()
        button.setTitle("Confirm", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.rgbCustomColor(red: 87, green: 143, blue: 255)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
        button.layer.cornerRadius = 2
        return button
    }()

    let deleteButton:UIButton = {
        let button = UIButton()
        button.setTitle("Delete", for: .normal)
        button.setTitleColor(UIColor(white: 0.3, alpha: 1), for: .normal)
        button.layer.cornerRadius = 2
        button.layer.borderColor = UIColor(white: 0.7, alpha: 1).cgColor
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
        return button
    }()

//    fileprivate func setupFriendsViews () {
//        addSubview(profileImageView)
//        addSubview(nameLabel)
//        addSubview(buttonsView)
//
//        /*****************************************************************
//         * "V:|-8-[v0(44)]|"
//         * 8 desde el elemento al top y altura del elemento (v0(44))
//         ****************************************************************/
//        addConstraintsWithFormat(format: "V:|-8-[v0(150)]|", views: profileImageView)
//        addConstraintsWithFormat(format: "V:|-8-[v0(44)]|", views: nameLabel)
//
//        /*****************************************************************
//         * "H:|-8-[v0(44)]-8-[v1]-8-|"
//         * Horizontalmente margen anchura del elemento(v0(44)) margen al siguiente elemento
//         * [v1] siguiente elemento margen
//         ****************************************************************/
//        addConstraintsWithFormat(format: "H:|-8-[v0(150)]-8-[v1]-8-[v2]-8-|", views: profileImageView, nameLabel, buttonsView)
//
//        /*****************************************************************
//         *"V:|-MARGEN TOP A SUPER VISTA-[v0(ALTURA)]-MARGEN BOTOM A SUPER VISTA-|"
//         *"H:|-MARGEN IZQ A SUPER VISTA-[v0(ANCHO)]-MARGEN DER A SUPER VISTA-|"
//         ****************************************************************/
//        addConstraintsWithFormat(format: "V:|-8-[v0]-8-[v1]-8-[v2(v1)]-8-|", views: profileImageView, nameLabel, buttonsView)
//        addConstraintsWithFormat(format: "H:[v0(44)]", views: buttonsView)
//
////        addConstraintsWithFormat(format: "H:|-8-[v0]-8-[v1]-8-|", views: profileImageView, buttonsView)
////        addConstraintsWithFormat(format: "V:|-8-[v0]-8-[v1]|", views: nameLabel, buttonsView)
//    }
    fileprivate func setupFriendsViews () {
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(confirmButton)
        addSubview(deleteButton)

        addConstraintsWithFormat(format: "H:|-16-[v0(52)]-8-[v1]|", views: profileImageView, nameLabel)

        addConstraintsWithFormat(format: "V:|-4-[v0]-4-|", views: profileImageView)
        addConstraintsWithFormat(format: "V:|-8-[v0]-8-[v1(24)]-8-|", views: nameLabel, confirmButton)

        addConstraintsWithFormat(format: "H:|-76-[v0(80)]-8-[v1(80)]|", views: confirmButton, deleteButton)
        addConstraintsWithFormat(format: "V:[v0(24)]-8-|", views: deleteButton)



    }

}

extension FriendsRequestCell {
    static func buttonTitleAndImage (titleButton: String, imageButton: String, color: UIColor, font: UIFont) -> UIButton {
        let button = UIButton()
        button.setTitle(titleButton, for: .normal)
        button.setTitleColor(color, for: .normal)
        button.setImage(UIImage(named: imageButton), for: .normal)
        button.titleLabel?.font = font
        return button
    }
}


