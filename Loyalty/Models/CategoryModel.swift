//
//  CategoriesModel.swift
//  Loyalty
//
//  Created by Alain on 28/11/2018.
//  Copyright © 2018 iOSHetic. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CategoriesModel: NSObject {
    
    func fetchCategories(completionHandler: @escaping ([Category]) -> ()) {
        let url = "http://private-2114d-loyaltyhetic.apiary-mock.com/categories"
        
        Alamofire.request(url).responseJSON { (response) in
            if let realData = response.data {
                let json = JSON(realData)
                
                let movieListJSON = json["results"].arrayValue
                
                var movies:[Movie] = [Movie]()
                
                for movieJSON in movieListJSON {
                    let movie = Movie(json: movieJSON)
                    
                    movies.append(movie)
                }
                
                completionHandler(movies)
            }
        }
    }
    
}
