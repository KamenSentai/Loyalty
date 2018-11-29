//
//  LoginPartnerViewController.swift
//  Loyalty
//
//  Created by Loris Marino on 28/11/2018.
//  Copyright © 2018 iOSHetic. All rights reserved.
//

import UIKit

class LoginPartnerViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotButton: UIButton!
    @IBOutlet weak var connectionButton: UIButton!
    @IBOutlet weak var conditionsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Styles
        
        loginTextField.placeholder = "Identifiant"
        loginTextField.layer.cornerRadius = loginTextField.frame.size.height / 2
        loginTextField.clipsToBounds = true
        
        passwordTextField.placeholder = "Mot de passe"
        passwordTextField.layer.cornerRadius = loginTextField.frame.size.height / 2
        passwordTextField.clipsToBounds = true
        
        forgotButton.setTitle("Mot de passe oublié ?", for: .normal)
        forgotButton.tintColor = .white
        forgotButton.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight:UIFont.Weight(rawValue: 500))
        
        connectionButton.tintColor = .white
        connectionButton.layer.borderColor = UIColor.white.cgColor
        connectionButton.layer.borderWidth = 1
        connectionButton.layer.cornerRadius = connectionButton.frame.height / 2
        connectionButton.clipsToBounds = true
        connectionButton.setTitle("Se connecter", for: .normal)
        connectionButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        
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
