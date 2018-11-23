//
//  MoreViewController.swift
//  Loyalty
//
//  Created by Alain on 21/11/2018.
//  Copyright © 2018 iOSHetic. All rights reserved.
//

import UIKit

struct moreCellData {
    var opened = Bool()
    var label = String()
    var userData = [String: String]()
    var partnersData = [String]()
    var textData = [String]()
}

class MoreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var moreTableViewData = [moreCellData]()

    @IBOutlet weak var moreTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do not edit
        moreTableView.delegate = self
        moreTableView.dataSource = self
        moreTableView.separatorStyle = .none
        
        // Can edit
        moreTableViewData = [
            moreCellData(
                opened: false,
                label: "Number 1",
                userData: ["userPhoto": "", "userName": "Bourienne"],
                partnersData: [],
                textData: []
            ),
            moreCellData(
                opened: false,
                label: "Number 2",
                userData: [:],
                partnersData: ["Amazon", "Carrefour", "Ikea", "Monoprix"],
                textData: []
            ),
            moreCellData(
                opened: false,
                label: "Number 3",
                userData: [:],
                partnersData: [],
                textData: ["Vos daronnes ils boivent du Sprite sa mère"]
            ),
            moreCellData(
                opened: false,
                label: "Number 4",
                userData: [:],
                partnersData: [],
                textData: ["Qu'est-ce qui est jaune et qui attend ?"]
            )
        ]
    }
    
    // Do not edit
    func numberOfSections(in tableView: UITableView) -> Int {
        return moreTableViewData.count
    }
    
    // Do not edit
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if moreTableViewData[section].opened == true {
            if moreTableViewData[section].userData.count > 0 {
                return moreTableViewData[section].userData.count + 1
            } else if moreTableViewData[section].partnersData.count > 0 {
                return moreTableViewData[section].partnersData.count + 1
            } else {
                return moreTableViewData[section].textData.count + 1
            }
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dot not edit
        if indexPath.row == 0 {
            
            guard let moreCell = tableView.dequeueReusableCell(withIdentifier: "MoreTableViewCell") else {return UITableViewCell()}
            moreCell.textLabel?.text = moreTableViewData[indexPath.section].label
            return moreCell
            
        } else {
            
            if moreTableViewData[indexPath.section].userData.count > 0 {
                
                // Cell MoreUserTableViewCell in storyboard
                guard let moreCell = tableView.dequeueReusableCell(withIdentifier: "MoreUserTableViewCell") else {return UITableViewCell()}
                /* Can edit */
                return moreCell
                
            } else if moreTableViewData[indexPath.section].partnersData.count > 0 {
                
                // Cell MorePartnersTableViewCell in storyboard
                guard let moreCell = tableView.dequeueReusableCell(withIdentifier: "MorePartnersTableViewCell") else {return UITableViewCell()}
                /* Can edit */
                moreCell.textLabel?.text = moreTableViewData[indexPath.section].partnersData[indexPath.row - 1]
                return moreCell
                
            } else {
                
                // Cell MoreTextTableViewCell in storyboard
                guard let moreCell = tableView.dequeueReusableCell(withIdentifier: "MoreTextTableViewCell") else {return UITableViewCell()}
                /* Can edit */
                moreCell.textLabel?.text = moreTableViewData[indexPath.section].textData[indexPath.row - 1]
                return moreCell
                
            }
        }
    }
    
    // Do not edit
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if moreTableViewData[indexPath.section].opened == true && indexPath.row == 0 {
            moreTableViewData[indexPath.section].opened = false
            
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        } else {
            moreTableViewData[indexPath.section].opened = true
            
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
        }
    }

}
