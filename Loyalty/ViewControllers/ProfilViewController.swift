//
//  ProfilViewController.swift
//  Loyalty
//
//  Created by Loris Marino on 24/11/2018.
//  Copyright © 2018 iOSHetic. All rights reserved.
//

import UIKit

class ProfilViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var profilImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var changePasswordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Styles
        
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight:UIFont.Weight(rawValue: 500))
        titleLabel.textAlignment = .center
        titleLabel.text = "Profil"
        
        profilImageView.image = UIImage(named: "AppIcon")
        
        nameLabel.font = UIFont.systemFont(ofSize: 14, weight:UIFont.Weight(rawValue: 500))
        nameLabel.textAlignment = .center
        nameLabel.text = "Loris Marino"
        
        changePasswordLabel.font = UIFont.systemFont(ofSize: 12, weight:UIFont.Weight(rawValue: 500))
        changePasswordLabel.textColor = UIColor(red: 1,
                                                green: 0.18,
                                                blue: 0.33,
                                                alpha: 1)
        profilImageView.layer.cornerRadius = profilImageView.frame.size.width / 2;
        profilImageView.clipsToBounds = true;
        changePasswordLabel.textAlignment = .center
        changePasswordLabel.text = "Changer mon mot de passe"
        
        // Do any additional setup after loading the view.
    }
    
}
