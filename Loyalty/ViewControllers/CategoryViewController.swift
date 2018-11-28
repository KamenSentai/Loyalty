//
//  CategoryViewController.swift
//  Loyalty
//
//  Created by Alain on 26/11/2018.
//  Copyright © 2018 iOSHetic. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var category: Category = Category(category: "", identifier: "", isAdded: true, cards: [[:]])
    
    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardCollectionView.delegate = self
        cardCollectionView.dataSource = self
        
        cardCollectionView!.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        self.navigationController?.navigationBar.topItem?.title = "Catégories"
        
        self.pageTitle.font = UIFont.boldSystemFont(ofSize: 24.0)
        
        self.categoryTitle.font = UIFont.boldSystemFont(ofSize: 20.0)
        self.categoryTitle.text = self.category.category

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cardCollectionViewCell = cardCollectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as! CardCollectionViewCell
        
        cardCollectionViewCell.backgroundColor = UIColor.white
        cardCollectionViewCell.layer.cornerRadius = 10
        cardCollectionViewCell.layer.shadowColor = UIColor.black.cgColor
        cardCollectionViewCell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cardCollectionViewCell.layer.shadowRadius = 5.0
        cardCollectionViewCell.layer.shadowOpacity = 0.125
        cardCollectionViewCell.layer.masksToBounds = false
        
        if let layout = self.cardCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let width = self.cardCollectionView.collectionViewLayout.collectionViewContentSize.width
            layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
            layout.itemSize = CGSize(width: width, height: width / 2 - 15)
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 20
        }
        
        return cardCollectionViewCell
    }

}
