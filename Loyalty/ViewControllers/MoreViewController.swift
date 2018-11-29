//
//  MoreViewController.swift
//  Loyalty
//
//  Created by Alain on 21/11/2018.
//  Copyright © 2018 iOSHetic. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cellsLabels: [String] = []
    
    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var moreTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do not edit
        moreTableView.delegate = self
        moreTableView.dataSource = self
        moreTableView.separatorStyle = .none
//        moreTableView.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        self.cellsLabels = [
            "Profil",
            "Partenaires",
            "Conditions d'utilisation",
            "Politique de confidentialité",
        ]
        
        self.pageTitle.font = UIFont.boldSystemFont(ofSize: 24.0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    // Do not edit
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellsLabels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let moreTableViewCell = moreTableView.dequeueReusableCell(withIdentifier: "MoreTableViewCell", for: indexPath) as! MoreTableViewCell
        
        moreTableViewCell.moreLabel.text = self.cellsLabels[indexPath.row]
        
        moreTableViewCell.backgroundColor = UIColor.white
        moreTableViewCell.layer.cornerRadius = 10
        moreTableViewCell.layer.shadowColor = UIColor.black.cgColor
        moreTableViewCell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        moreTableViewCell.layer.shadowRadius = 5.0
        moreTableViewCell.layer.shadowOpacity = 0.125
        moreTableViewCell.layer.masksToBounds = false
        
        return moreTableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if indexPath.row == 0 {
            let moreController = storyboard.instantiateViewController(withIdentifier: "ProfilViewController") as! ProfilViewController
            navigationController?.pushViewController(moreController, animated: true)
        } else if indexPath.row == 1 {
            let moreController = storyboard.instantiateViewController(withIdentifier: "PartnersViewController") as! PartnersViewController
            navigationController?.pushViewController(moreController, animated: true)
        } else if indexPath.row == 2 {
            let moreController = storyboard.instantiateViewController(withIdentifier: "ConditionsViewController") as! TextPageViewController
            navigationController?.pushViewController(moreController, animated: true)
        } else if indexPath.row == 3 {
            let moreController = storyboard.instantiateViewController(withIdentifier: "ConfidentialityViewController") as! TextPageViewController
            navigationController?.pushViewController(moreController, animated: true)
        }
    }

}
