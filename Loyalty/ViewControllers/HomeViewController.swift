//
//  HomeViewController.swift
//  Loyalty
//
//  Created by Alain on 21/11/2018.
//  Copyright © 2018 iOSHetic. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var categoriesData: [[String: String]] = [[:]]
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        categoryCollectionView!.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        
        categoriesData = [
            [
                "categoryLabel": "Vêtement",
                "categoryImage": "clothing"
            ],
            [
                "categoryLabel": "Automobile",
                "categoryImage": "automotive"
            ],
            [
                "categoryLabel": "Restauration",
                "categoryImage": "restaurant"
            ],
            [
                "categoryLabel": "Décoration",
                "categoryImage": "decoration"
            ],
            [
                "categoryLabel": "Marché",
                "categoryImage": "shopping"
            ],
            [
                "categoryLabel": "Cinéma",
                "categoryImage": "cinema"
            ],
        ]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func addCategoryAction(_ sender: Any) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
        let addCategoryViewController = storyboard.instantiateViewController(withIdentifier: "AddCatagoryViewController") as! AddCatagoryViewController
        navigationController?.pushViewController(addCategoryViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130.0, height: 130.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categoriesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let categoryCollectionViewCell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        
    categoryCollectionViewCell.categoryImage.image = UIImage(named: categoriesData[indexPath.row]["categoryImage"] ?? "")
        categoryCollectionViewCell.categoryImage.contentMode = .scaleAspectFit
        categoryCollectionViewCell.categoryLabel.text = categoriesData[indexPath.row]["categoryLabel"]
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let categoryController = storyboard.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        categoryController.categoryIndex = indexPath.row
        
        navigationController?.pushViewController(categoryController, animated: true)
    }
}
