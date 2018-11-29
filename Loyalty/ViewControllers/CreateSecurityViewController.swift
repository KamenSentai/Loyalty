//
//  CreateSecurityViewController.swift
//  Loyalty
//
//  Created by Loris Marino on 28/11/2018.
//  Copyright © 2018 iOSHetic. All rights reserved.
//

import UIKit

class CreateSecurityViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var securityCodeStackView: UIStackView!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Styles
        
        titleLabel.text = "Déterminez votre code de sécurité"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight:UIFont.Weight(rawValue: 500))
        
        securityCodeStackView.spacing = 20
        
        submitButton.tintColor = UIColor(red:1.00, green:0.18, blue:0.33, alpha:1.0)
        submitButton.backgroundColor = .white
        submitButton.setTitle("Créer une sécurité", for: .normal)
        submitButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight:UIFont.Weight(rawValue: 500))
        submitButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        submitButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        submitButton.layer.shadowOpacity = 1.0
        submitButton.layer.shadowRadius = 6.0
        submitButton.layer.masksToBounds = false

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
