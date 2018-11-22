//
//  MoreViewController.swift
//  Loyalty
//
//  Created by Alain on 21/11/2018.
//  Copyright © 2018 iOSHetic. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var moreTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moreTableView.delegate = self
        moreTableView.dataSource = self
        
        moreTableView.separatorStyle = .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let moreCell = tableView.dequeueReusableCell(withIdentifier: "MoreTableViewCell", for: indexPath)as! MoreTableViewCell
        
        moreCell.moreCellLabel.text = "Hello"
        
        return moreCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}
