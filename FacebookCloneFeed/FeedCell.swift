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

        label.numberOfLines = 2
        let attributedText = NSMutableAttributedString(string: "_Beth", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSAttributedString(string: "\nDecember 18 • San Francisco • ", 
                attributes:  [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.rgbCustomColor(red: 155, green: 161, blue: 171)]))
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.count))
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "004-grid-world.imageset")
        attachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
        attributedText.append(NSAttributedString(attachment: attachment))
        label.attributedText = attributedText
        return label
    }()

    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "Beth")
        return imageView
    }()

    let statusTextView: UITextView = {
        let textView = UITextView()
        textView.text = "MeanWhile, beast turened to the dark side."
        textView.font = UIFont.systemFont(ofSize: 14)
        return textView
    }()

    let statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "Lang")
        return imageView
    }()

    let likesCommentsLabel: UILabel = {
        let label = UILabel()
        label.text = "480 likes 1.7k Comments"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.rgbCustomColor(red: 155, green: 161, blue: 171)
        return label
    }()

    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgbCustomColor(red: 226, green: 228, blue: 232)
        return view
    }()

    let likeButton: UIButton = {
        let button = UIButton(frame: CGRect())
        button.setTitle("Like", for: .normal)
        button.setTitleColor(UIColor.rgbCustomColor(red: 143, green: 150, blue: 263), for: .normal)
        button.setImage(UIImage(named: "003-like.imageset"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        return button
    }()

    let commentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Comment", for: .normal)
        button.setTitleColor(UIColor.rgbCustomColor(red: 143, green: 150, blue: 263), for: .normal)
        button.setImage(UIImage(named: "002-comment.imageset"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)


        return button
    }()

    private func setupViews() {
        backgroundColor = UIColor.white

        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(statusTextView)
        addSubview(statusImageView)
        addSubview(likesCommentsLabel)
        addSubview(dividerLineView)
        addSubview(likeButton)
        addSubview(commentButton)

        addConstraintsWithFormat(format: "H:|-8-[v0(44)]-8-[v1]|", views: profileImageView,  nameLabel)
        addConstraintsWithFormat(format: "H:|-4-[v0]-4-|", views: statusTextView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: statusImageView)
        addConstraintsWithFormat(format: "H:|-12-[v0]|", views: likesCommentsLabel)
        addConstraintsWithFormat(format: "H:|-12-[v0]-12-|", views: dividerLineView)
        addConstraintsWithFormat(format: "H:|-12-[v0]-12-|", views: likeButton)
        addConstraintsWithFormat(format: "V:|-12-[v0]", views: nameLabel)
        addConstraintsWithFormat(format: "V:|-8-[v0(44)]-4-[v1(30)]-4-[v2]-8-[v3(24)]-8-[v4(1)]-8-[v5(44)]-8-[v6(44)]-8-|", views: profileImageView, statusTextView, statusImageView, likesCommentsLabel, dividerLineView, likeButton, commentButton)

    }
}

extension UIColor {
    static func rgbCustomColor (red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UIView {
    func addConstraintsWithFormat (format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

























