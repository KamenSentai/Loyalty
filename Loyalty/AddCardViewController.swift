//
//  AddCardViewController.swift
//  Loyalty
//
//  Created by Alain on 21/11/2018.
//  Copyright © 2018 iOSHetic. All rights reserved.
//

import UIKit

class AddCardViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerData: [String] = [String]()

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var cardTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = "Catégories"
        
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        self.subtitleLabel.font = UIFont.systemFont(ofSize: 16.0)
        
        self.categoryPicker.delegate = self
        self.categoryPicker.dataSource = self
        
        pickerData = [
            "Vêtement",
            "Automobile",
            "Restauration",
            "Décoration",
            "Marché",
            "Cinéma",
            "Technologie",
            "Musée",
            "École"
        ]
        
        self.cardTextField.placeholder = "Entrez le nom de votre carte"
        
        self.addButton.layer.cornerRadius = 10
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    @IBAction func addAction(_ sender: Any) {
    }
}
