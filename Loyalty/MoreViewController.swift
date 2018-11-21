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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let moreCell = tableView.dequeueReusableCell(withIdentifier: "MoreViewCell", for: indexPath)as! MoreTableViewCell
        
        moreCell.moreCellLabel.text = "Hello"
        
        return moreCell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moreTableView.delegate = self
        moreTableView.dataSource = self
        
//        moreTableView.separatorStyle = .none

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
