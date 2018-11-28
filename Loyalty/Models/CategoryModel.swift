//
//  CategoryModel.swift
//  Loyalty
//
//  Created by Alain on 28/11/2018.
//  Copyright © 2018 iOSHetic. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CategoryModel: NSObject {
    
    func fetchCategories(completionHandler: @escaping ([Category]) -> ()) {
        let url = "http://private-2114d-loyaltyhetic.apiary-mock.com/categories"
        
        Alamofire.request(url).responseJSON { (response) in
            if let realData = response.data {
                let json = JSON(realData)
                
                let categoryListJSON = json["categories"].arrayValue
                
                var categories: [Category] = [Category]()
                
                for categoryJSON in categoryListJSON {
                    let category = Category(json: categoryJSON)

                    categories.append(category)
                }
                
                completionHandler(categories)
            }
        }
    }
    
}
