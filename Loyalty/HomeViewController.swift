//
//  HomeViewController.swift
//  Loyalty
//
//  Created by Alain on 21/11/2018.
//  Copyright © 2018 iOSHetic. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchBar.searchBarStyle = .minimal
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        categoryCollectionView!.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    @IBAction func addCardAction(_ sender: Any) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
        let addCategoryViewController = storyboard.instantiateViewController(withIdentifier: "AddCardViewController") as! AddCardViewController
        navigationController?.pushViewController(addCategoryViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130.0, height: 130.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let categoryCollectionViewCell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        
        categoryCollectionViewCell.backgroundColor = UIColor.white
        categoryCollectionViewCell.layer.cornerRadius = 10
        categoryCollectionViewCell.layer.shadowColor = UIColor.black.cgColor
        categoryCollectionViewCell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        categoryCollectionViewCell.layer.shadowRadius = 5.0
        categoryCollectionViewCell.layer.shadowOpacity = 0.25
        categoryCollectionViewCell.layer.masksToBounds = false
        
        if let layout = self.categoryCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let width = self.categoryCollectionView.collectionViewLayout.collectionViewContentSize.width
            layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
            layout.itemSize = CGSize(width: width / 2 - 15, height: width / 2 - 15)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 20
        }
        
        return categoryCollectionViewCell
    }
}
