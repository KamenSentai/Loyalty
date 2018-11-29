//
//  AddCardViewController.swift
//  Loyalty
//
//  Created by Alain on 29/11/2018.
//  Copyright © 2018 iOSHetic. All rights reserved.
//

import UIKit

class AddCardViewController: UIViewController {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = "Cartes"

        self.headerLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        self.infoLabel.font = UIFont.systemFont(ofSize: 16.0)
        self.infoLabel.textColor = UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1.0)
        self.addButton.layer.cornerRadius = 10
        self.addButton.backgroundColor = UIColor(white: 0.0, alpha: 0.25)
        self.addButton.tintColor = UIColor(white: 1.0, alpha: 1.0)
    }

}
