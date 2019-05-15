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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        registerCollectionViewController()
        setupUI()
    }

    func registerCollectionViewController()  {
        myCollectionView.register(FeedCell.self, forCellWithReuseIdentifier: cellID)
    }
    
    func setupCollection() {
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
    }

    func setupUI(){
        navigationItem.title = "Facebook Feed"
        myCollectionView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
}

extension FeedCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCollectionCell = myCollectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! FeedCell
        return myCollectionCell
    }
}

extension FeedCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 400)
    }
    
}
