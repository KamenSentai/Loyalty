//
//  FavoriteViewController.swift
//  Loyalty
//
//  Created by Alain on 21/11/2018.
//  Copyright © 2018 iOSHetic. All rights reserved.
//

import UIKit


class FavoriteViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate {
    
    var categories: [Category] = [Category]()
    var cardsFavorite: [[String: Any]] = [[:]]

    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var searchBar: SearchBar!
    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        cardCollectionView.delegate = self
        cardCollectionView.dataSource = self
        
        self.cardCollectionView!.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        self.pageTitle.font = UIFont.boldSystemFont(ofSize: 24.0)
        
        let categoryModel = CategoryModel()
        self.cardsFavorite.removeAll()
        categoryModel.fetchCategories { (categoriesFromJSON) in
            self.categories = categoriesFromJSON
            for category in self.categories {
                if category.isAdded == true {
                    for card in category.cards {
                        if card["isFavorite"] as! Bool == true {
                            var cardFavorite = card
                            cardFavorite["leftColor"] = category.leftColor
                            cardFavorite["rightColor"] = category.rightColor
                            self.cardsFavorite.append(cardFavorite)
                        }
                    }
                }
            }
            self.cardCollectionView.reloadData()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        self.categoriesDisplayed.removeAll()
//        if searchText == "" {
//            self.categoriesDisplayed = self.categoriesAdded
//        } else {
//            let pattern = "\(searchText.lowercased())"
//            for categoryAdded in self.categoriesAdded {
//                let string = categoryAdded.category.lowercased()
//                if string ~= pattern {
//                    self.categoriesDisplayed.append(categoryAdded)
//                }
//            }
//        }
//        self.categoryCollectionView.reloadData()
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cardsFavorite.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cardCollectionViewCell = cardCollectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as! CardCollectionViewCell
        
        let card = self.cardsFavorite[indexPath.row]
        
        cardCollectionViewCell.backgroundColor = UIColor.white
        cardCollectionViewCell.layer.cornerRadius = 10
        cardCollectionViewCell.layer.shadowColor = UIColor.black.cgColor
        cardCollectionViewCell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cardCollectionViewCell.layer.shadowRadius = 5.0
        cardCollectionViewCell.layer.shadowOpacity = 0.125
        cardCollectionViewCell.layer.masksToBounds = false
        cardCollectionViewCell.topView.roundCorners([.topLeft, .topRight], radius: 10)
        
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [
            hexStringToUIColor(hex: card["leftColor"] as! String).cgColor,
            hexStringToUIColor(hex: card["rightColor"] as! String).cgColor
        ]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: cardCollectionViewCell.topView.frame.size.width, height: cardCollectionViewCell.topView.frame.size.height / 2 * 1.5)
        
        cardCollectionViewCell.topView.layer.insertSublayer(gradient, at: 0)
        cardCollectionViewCell.separatorView.backgroundColor = UIColor(white: 0.0, alpha: 0.25)
        
        if let urlImage = URL(string: "http://api.qrserver.com/v1/create-qr-code/?size=150x150&data=\(card["id"] ?? "Loyalty")") {
            cardCollectionViewCell.codeImage.af_setImage(withURL: urlImage)
        }
        
        cardCollectionViewCell.cardName.text = card["name"] as? String
        cardCollectionViewCell.cardId.text = "N° ID : \(card["id"] as! Int)"
        cardCollectionViewCell.cardDate.text = "Date : \(card["date"] as! String)"
        
        if (card["total"] as! Int == 0) {
            cardCollectionViewCell.cardProgress.text = "Points : \(card["points"] as! Int)"
        } else {
            cardCollectionViewCell.cardProgress.text = "Tampons : \(card["points"] as! Int) / \(card["total"] as! Int)"
        }
        
        cardCollectionViewCell.cardName.font = UIFont.systemFont(ofSize: 16.0)
        cardCollectionViewCell.cardId.font = UIFont.systemFont(ofSize: 14.0)
        cardCollectionViewCell.cardDate.font = UIFont.systemFont(ofSize: 14.0)
        cardCollectionViewCell.cardProgress.font = UIFont.systemFont(ofSize: 16.0)
        
        cardCollectionViewCell.cardId.alpha = 0.5
        cardCollectionViewCell.cardDate.alpha = 0.5
        cardCollectionViewCell.cardProgress.alpha = 0.75
        
        cardCollectionViewCell.cardProgress.textColor = hexStringToUIColor(hex: "#ff2d55")
        
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

