//
//  AddCatagoryViewController.swift
//  Loyalty
//
//  Created by Alain on 21/11/2018.
//  Copyright © 2018 iOSHetic. All rights reserved.
//

import UIKit

class AddCatagoryViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var categoriesNotAdded: [Category] = [Category]()
    var pickerIndex: Int = 0
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = "Catégories"
        
        self.categoryPicker.delegate = self
        self.categoryPicker.dataSource = self
        
        self.headerLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        self.infoLabel.font = UIFont.systemFont(ofSize: 16.0)
        self.infoLabel.textColor = UIColor(red: 0.55, green: 0.55, blue: 0.55, alpha: 1.0)
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
        return categoriesNotAdded.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoriesNotAdded[row].category
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerIndex = row
    }
    
    @IBAction func addAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Catégorie créée", message: "La catégorie \(categoriesNotAdded[pickerIndex].category) a été créée avec succès.", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) { (action: UIAlertAction!) -> Void in
            
            self.categoriesNotAdded.remove(at: self.pickerIndex)
            
            if self.categoriesNotAdded.count == 0 {
                self.navigationController?.popViewController(animated: true)
            } else {
                self.categoryPicker.reloadAllComponents()
            }
        })
        
        self.present(alert, animated: true, completion: nil)
    }
}
