//
//  HomeViewController.swift
//  Loyalty
//
//  Created by Alain on 21/11/2018.
//  Copyright © 2018 iOSHetic. All rights reserved.
//

import UIKit

extension String {
    static func ~= (lhs: String, rhs: String) -> Bool {
        guard let regex = try? NSRegularExpression(pattern: rhs) else { return false }
        let range = NSRange(location: 0, length: lhs.utf16.count)
        return regex.firstMatch(in: lhs, options: [], range: range) != nil
    }
}

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    
    var categories: [Category] = [Category]()
    var categoriesAdded: [Category] = [Category]()
    var categoriesNotAdded: [Category] = [Category]()
    var categoriesDisplayed: [Category] = [Category]()
    
    @IBOutlet weak var searchBar: SearchBar!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        categoryCollectionView!.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        
        let categoryModel = CategoryModel()
        categoryModel.fetchCategories { (categoriesFromJSON) in
            self.categories = categoriesFromJSON
            for category in self.categories {
                if category.isAdded == true {
                    self.categoriesAdded.append(category)
                } else {
                    self.categoriesNotAdded.append(category)
                }
            }
            self.categoriesDisplayed = self.categoriesAdded
            self.categoryCollectionView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.categoriesDisplayed.removeAll()
        if searchText == "" {
            self.categoriesDisplayed = self.categoriesAdded
        } else {
            let pattern = "\(searchText.lowercased())"
            for categoryAdded in self.categoriesAdded {
                let string = categoryAdded.category.lowercased()
                if string ~= pattern {
                    self.categoriesDisplayed.append(categoryAdded)
                }
            }
        }
        self.categoryCollectionView.reloadData()
    }
    
    @IBAction func addCategoryAction(_ sender: Any) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
        let addCategoryViewController = storyboard.instantiateViewController(withIdentifier: "AddCatagoryViewController") as! AddCatagoryViewController
        addCategoryViewController.categoriesNotAdded = self.categoriesNotAdded
        navigationController?.pushViewController(addCategoryViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130.0, height: 130.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categoriesDisplayed.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let categoryCollectionViewCell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        
        categoryCollectionViewCell.categoryImage.contentMode = .scaleAspectFit
        categoryCollectionViewCell.categoryImage.image = UIImage(named: self.categoriesDisplayed[indexPath.row].identifier)
        categoryCollectionViewCell.categoryLabel.text = self.categoriesDisplayed[indexPath.row].category
        
        categoryCollectionViewCell.backgroundColor = UIColor.white
        categoryCollectionViewCell.layer.cornerRadius = 10
        categoryCollectionViewCell.layer.shadowColor = UIColor.black.cgColor
        categoryCollectionViewCell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        categoryCollectionViewCell.layer.shadowRadius = 5.0
        categoryCollectionViewCell.layer.shadowOpacity = 0.125
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
        categoryController.category = self.categoriesDisplayed[indexPath.row]
        
        navigationController?.pushViewController(categoryController, animated: true)
    }
}
