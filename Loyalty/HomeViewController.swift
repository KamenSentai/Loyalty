//
//  HomeViewController.swift
//  Loyalty
//
//  Created by Alain on 21/11/2018.
//  Copyright © 2018 iOSHetic. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addCategoryAction(_ sender: Any) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
        let addCategoryViewController = storyboard.instantiateViewController(withIdentifier: "AddCategoryViewController") as! AddCategoryViewController
        navigationController?.pushViewController(addCategoryViewController, animated: true)
    }
}

