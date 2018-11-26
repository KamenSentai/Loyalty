//
//  SearchBar.swift
//  Loyalty
//
//  Created by Alain on 26/11/2018.
//  Copyright © 2018 iOSHetic. All rights reserved.
//

import UIKit

class SearchBar: UISearchBar {
    
    override func draw(_ rect: CGRect) {
        self.barTintColor = UIColor(red: 0xFF, green: 0xFF, blue: 0xFF, alpha: 0xFF)
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }

}
