//
//  AddCatagoryViewController.swift
//  Loyalty
//
//  Created by Alain on 21/11/2018.
//  Copyright © 2018 iOSHetic. All rights reserved.
//

import UIKit

class AddCatagoryViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerData: [String] = [String]()
    var pickerIndex: Int = 0

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = "Catégories"
        
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
        
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        self.subtitleLabel.font = UIFont.systemFont(ofSize: 16.0)
        self.subtitleLabel.textColor = UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1.0)
        
        self.categoryPicker.delegate = self
        self.categoryPicker.dataSource = self
        
        self.addButton.layer.cornerRadius = 10
        self.addButton.backgroundColor = UIColor(red: 1.0, green: 0.18, blue: 0.33, alpha: 1.0)
        self.addButton.tintColor = UIColor(white: 1.0, alpha: 1.0)
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerIndex = row
    }
    
    @IBAction func addAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Catégorie créée", message: "La catégorie \(pickerData[pickerIndex]) a été créée avec succès.", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { (action: UIAlertAction!) -> Void in
            
            self.pickerData.remove(at: self.pickerIndex)
            
            if self.pickerData.count == 0 {
                self.navigationController?.popViewController(animated: true)
            } else {
                self.categoryPicker.reloadAllComponents()
            }
        })
        
        self.present(alert, animated: true, completion: nil)
    }
}
