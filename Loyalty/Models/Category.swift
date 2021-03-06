//
//  Category.swift
//  Loyalty
//
//  Created by Alain on 28/11/2018.
//  Copyright © 2018 iOSHetic. All rights reserved.
//

import UIKit
import SwiftyJSON

class Category: NSObject {
    var category: String = ""
    var identifier: String = ""
    var leftColor: String = ""
    var rightColor: String = ""
    var isAdded: Bool = false
    var cards: [[String: Any]] = [[:]]
    
    init(category: String, identifier: String, leftColor: String, rightColor: String, isAdded: Bool, cards: [[String: Any]]) {
        self.category = category
        self.identifier = identifier
        self.leftColor = leftColor
        self.rightColor = rightColor
        self.isAdded = isAdded
        self.cards = cards
    }
    
    init(json: JSON) {
        self.category = json["category"].stringValue
        self.identifier = json["identifier"].stringValue
        self.leftColor = json["leftColor"].stringValue
        self.rightColor = json["rightColor"].stringValue
        self.isAdded = json["isAdded"].boolValue
        
        if self.isAdded == true {
            self.cards.removeAll()
            let cardsData = json["cards"].arrayValue
            
            for cardData in cardsData {
                let name = cardData["name"].stringValue
                let id = cardData["id"].intValue
                let date = cardData["date"].stringValue
                let points = cardData["points"].intValue
                let total = cardData["total"].intValue
                let isFavorite = cardData["isFavorite"].boolValue
                let card: [String: Any] = [
                    "name": name,
                    "id": id,
                    "date": date,
                    "points": points,
                    "total": total,
                    "isFavorite": isFavorite
                    ]
                
                self.cards.append(card)
            }
        }
    }
}
