//
//  MemesCollectionViewController.swift
//  Memes
//
//  Created by IT on 10/14/16.
//  Copyright © 2016 z0s. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"


class MemesCollectionViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var collectionView: UICollectionView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UICollectionViewFlowLayout()
//        
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
//        layout.itemSize = CGSize(width: 10, height: 30)
        
        
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        
       
        
        self.title = "Sent Memes"
        
        // Register cell classes
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = UIColor.cyan
        view.addSubview(collectionView)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }


    // MARK: UICollectionViewDataSource

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return appDelegate.memes.count
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
        let meme = appDelegate.memes[(indexPath as NSIndexPath).row]
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = meme.memedImage
        
        cell.contentView.addSubview(imageView)
        
        
        imageView.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: cell.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: cell.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
        
//        imageView.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor).isActive = true
//        imageView.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor).isActive = true
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMeme = appDelegate.memes[(indexPath as NSIndexPath).row]
        let vc = MemesDetailViewController()
        vc.selectedMeme = selectedMeme
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func collectionView(_ sizeForItemAtcollectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
//
//    func collectionView(_ minimumLineSpacingForSectionAtcollectionView: UICollectionView, layout
//        collectionViewLayout: UICollectionViewLayout,
//                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 1.0
//    }
  

 

}
