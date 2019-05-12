//
// Created by Alan Casas on 2019-05-12.
// Copyright (c) 2019 ___FULLUSERNAME___. All rights reserved.
//

import UIKit

class FeedCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "_DummyText"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .cyan
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private func setupViews() {
        backgroundColor = UIColor.white
        addSubview(nameLabel)
        addSubview(profileImageView)

        let horizontalConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|-8-[v0]-8-[v1]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": profileImageView,"v1": nameLabel])
        let verticalLabelConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": nameLabel])
        let verticalProfileConstraint = NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": profileImageView])
        addConstraints(horizontalConstraint)
        addConstraints(verticalLabelConstraint)
        addConstraints(verticalProfileConstraint)
    }
}

























