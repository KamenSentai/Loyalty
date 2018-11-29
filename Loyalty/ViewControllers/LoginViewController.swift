//
//  LoginViewController.swift
//  Loyalty
//
//  Created by Loris Marino on 27/11/2018.
//  Copyright © 2018 iOSHetic. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var createSecurityButton: UIButton!
    @IBOutlet weak var lockConnectLabel: UILabel!
    @IBOutlet weak var companyButton: UIButton!
    @IBOutlet weak var conditionsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Styles
        
        createSecurityButton.tintColor = UIColor(red:1.00, green:0.18, blue:0.33, alpha:1.0)
        createSecurityButton.backgroundColor = .white
        createSecurityButton.layer.cornerRadius = createSecurityButton.frame.height / 2
        createSecurityButton.clipsToBounds = true
        createSecurityButton.setTitle("Créer une sécurité", for: .normal)
        createSecurityButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight:UIFont.Weight(rawValue: 500))
        createSecurityButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        createSecurityButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        createSecurityButton.layer.shadowOpacity = 1.0
        createSecurityButton.layer.shadowRadius = 6.0
        createSecurityButton.layer.masksToBounds = false
        
        lockConnectLabel.text = "Rester connecté"
        lockConnectLabel.textColor = .white
        lockConnectLabel.font = UIFont.systemFont(ofSize: 15)
        
        companyButton.setTitle("Vous êtes une entreprise ?", for: .normal)
        companyButton.tintColor = .white
        companyButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        
        conditionsButton.setTitle("Conditions générales d'utilisation", for: .normal)
        conditionsButton.tintColor = .white
        conditionsButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        
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
