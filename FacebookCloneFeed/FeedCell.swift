//
// Created by Alan Casas on 2019-05-12.
// Copyright (c) 2019 ___FULLUSERNAME___. All rights reserved.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    var post: Post? {
        didSet{
            guard let name = post?.name else { return }
            
            let attributedText = NSMutableAttributedString(string: name, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)])
            attributedText.append(NSAttributedString(string: "\nDecember 18 • San Francisco • ",
                                                     attributes:  [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12), NSAttributedString.Key.foregroundColor: UIColor.rgbCustomColor(red: 155, green: 161, blue: 171)]))
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.count))
            let attachment = NSTextAttachment()
            attachment.image = UIImage(named: "004-grid-world.imageset")
            attachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
            attributedText.append(NSAttributedString(attachment: attachment))
            nameLabel.attributedText = attributedText
            
            guard let statusText = post?.statusText else { return }
            statusTextView.text = statusText
            
            guard let profileImageName = post?.profileImageName else { return }
            profileImageView.image = UIImage(named: profileImageName)
        
            guard let postImageName = post?.postImageName else { return }
            statusImageView.image = UIImage(named: postImageName)

            guard let numLikes = post?.numLikes else { return }
            guard let numComments = post?.numCommnts else { return }
            likesCommentsLabel.text = "\(numLikes) likes \(numComments) Comments"
            
        }
    }
    
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
        textView.isScrollEnabled = false
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

    let likeButton = buttonTitleAndImage(titleButton: "Like", imageButton: "003-like.imageset", color: UIColor.rgbCustomColor(red: 143, green: 150, blue: 263), font: UIFont.systemFont(ofSize: 14))
    let commentButton = buttonTitleAndImage(titleButton: "Comment", imageButton: "002-comment.imageset", color: UIColor.rgbCustomColor(red: 143, green: 150, blue: 263), font: UIFont.systemFont(ofSize: 14))
    let shareButton = buttonTitleAndImage(titleButton: "Share", imageButton: "001-share-option.imageset", color: UIColor.rgbCustomColor(red: 143, green: 150, blue: 263), font: UIFont.systemFont(ofSize: 14))

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
        addSubview(shareButton)

        addConstraintsWithFormat(format: "H:|-8-[v0(44)]-8-[v1]-8-|", views: profileImageView,  nameLabel)
        addConstraintsWithFormat(format: "H:|-4-[v0]-4-|", views: statusTextView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: statusImageView)
        addConstraintsWithFormat(format: "H:|-12-[v0]|", views: likesCommentsLabel)
        addConstraintsWithFormat(format: "H:|-12-[v0]-12-|", views: dividerLineView)

        //Buttons constraint
        addConstraintsWithFormat(format: "H:|-12-[v0(v2)]-12-[v1(v2)]-8-[v2]|", views: likeButton, commentButton, shareButton)
        addConstraintsWithFormat(format: "V:|-12-[v0]", views: nameLabel)
        addConstraintsWithFormat(format: "V:|-8-[v0(44)]-4-[v1]-4-[v2(200)]-8-[v3(24)]-8-[v4(1)]-8-[v5(44)]-8-|", views: profileImageView, statusTextView, statusImageView, likesCommentsLabel, dividerLineView, likeButton)

        addConstraintsWithFormat(format: "V:[v0(44)]|", views: commentButton)
        addConstraintsWithFormat(format: "V:[v0(44)]|", views: shareButton)

    }
}

extension FeedCell {
    static func buttonTitleAndImage (titleButton: String, imageButton: String, color: UIColor, font: UIFont) -> UIButton {
        let button = UIButton()
        button.setTitle(titleButton, for: .normal)
        button.setTitleColor(color, for: .normal)
        button.setImage(UIImage(named: imageButton), for: .normal)
        button.titleLabel?.font = font
        return button
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

























