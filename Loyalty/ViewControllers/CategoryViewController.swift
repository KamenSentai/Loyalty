//
//  CategoryViewController.swift
//  Loyalty
//
//  Created by Alain on 26/11/2018.
//  Copyright © 2018 iOSHetic. All rights reserved.
//

import UIKit
import AlamofireImage

extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

class CategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var category: Category = Category(category: "", identifier: "", leftColor: "#ff2d55", rightColor: "#ff2d55", isAdded: true, cards: [[:]])
    
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
    
    @IBAction func addCardAction(_ sender: Any) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
        let addCategoryViewController = storyboard.instantiateViewController(withIdentifier: "AddCardViewController") as! AddCardViewController
        navigationController?.pushViewController(addCategoryViewController, animated: true)
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
        return self.category.cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cardCollectionViewCell = cardCollectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as! CardCollectionViewCell
        
        let card = self.category.cards[indexPath.row]
        
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
            hexStringToUIColor(hex: self.category.leftColor).cgColor,
            hexStringToUIColor(hex: self.category.rightColor).cgColor
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
