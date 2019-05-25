//
//  FeedCollectionViewController.swift
//  FacebookCloneFeed
//
//  Created by Alan Casas on 12/05/2019.
//  Copyright © 2019 Alan Casas. All rights reserved.
//

import UIKit

let cellID = "CellID"

class FeedCollectionViewController: UIViewController {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    let postMark = Post(name: "Mark Zuckerber", statusText: "Facebook inventor",profileImageName: "Ahmed", numLikes: 486, numCommnts: 1900, postImageName: "Ahmed")
    let postSteve = Post(name: "Steve Jobs", statusText: "iOS Inventor, apple tv, iPhone, iPad, Mac, MacBook, oiajsoaijsoiajsdoaisjasd asoijadsoij asdioja soijadsoijd asijd asijdaspoij dasija sdpoiasj aoijsd aoijd poiejdeoijemosic iojf wioejf woiej fcmoiwej foij ",profileImageName: "Beth", numLikes: 530, numCommnts: 903, postImageName: "Beth")
    let postMusk = Post(name: "Mark Zuckerber", statusText: "Facebook inventor",profileImageName: "Ahmed", numLikes: 486, numCommnts: 1900, postImageName: "Ahmed")
    let postGhandi = Post(name: "Steve Jobs", statusText: "iOS Inventor, apple tv, iPhone, iPad, Mac, MacBook, oiajsoaijsoiajsdoaisjasd asoijadsoij asdioja soijadsoijd asijd asijdaspoij dasija sdpoiasj aoijsd aoijd poiejdeoijemosic iojf wioejf woiej fcmoiwej foij ",profileImageName: "Beth", numLikes: 530, numCommnts: 903, postImageName: "Beth")
    let postLilan = Post(name: "Mark Zuckerber", statusText: "Facebook inventor",profileImageName: "Ahmed", numLikes: 486, numCommnts: 1900, postImageName: "Ahmed")
    let postNoel = Post(name: "Steve Jobs", statusText: "iOS Inventor, apple tv, iPhone, iPad, Mac, MacBook, oiajsoaijsoiajsdoaisjasd asoijadsoij asdioja soijadsoijd asijd asijdaspoij dasija sdpoiasj aoijsd aoijd poiejdeoijemosic iojf wioejf woiej fcmoiwej foij ",profileImageName: "Beth", numLikes: 530, numCommnts: 903, postImageName: "Beth")
    let postBono = Post(name: "Mark Zuckerber", statusText: "Facebook inventor",profileImageName: "Ahmed", numLikes: 486, numCommnts: 1900, postImageName: "Ahmed")
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        registerCollectionViewController()
        setupUI()
        posts.append(postMark)
        posts.append(postSteve)
        posts.append(postMusk)
        posts.append(postGhandi)
        posts.append(postLilan)
        posts.append(postNoel)
        posts.append(postBono)

    }

    func registerCollectionViewController()  {
        myCollectionView.register(FeedCell.self, forCellWithReuseIdentifier: cellID)
    }
    
    func setupCollection() {
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }

    func setupUI(){
        self.title = "News feed"
        myCollectionView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }

    func animateImageView (statusImageView : UIImageView) {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.frame = statusImageView.frame
        view.addSubview(view)
    }

}

extension FeedCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCollectionCell = myCollectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! FeedCell        
        myCollectionCell.post = posts[indexPath.row]
        return myCollectionCell
    }

    public override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        myCollectionView.collectionViewLayout.invalidateLayout()
    }
}

extension FeedCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        

        if let statusText = posts[indexPath.row].statusText {
            let rect = NSString(string: statusText).boundingRect(with: CGSize(width: view.frame.width, height: 1000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)], context: nil)

            let knowedHeight: CGFloat = 8+44+4+4+200+8+24+8+1+8+44+8

            return CGSize(width: view.frame.width, height: rect.height + knowedHeight + 24)
        }
        
        return CGSize(width: view.frame.width, height: 300)
    }
    
}
