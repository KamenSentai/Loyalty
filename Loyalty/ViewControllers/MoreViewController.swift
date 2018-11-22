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
    var sectionData = [String]()
}

class MoreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var moreTableViewData = [moreCellData]()

    @IBOutlet weak var moreTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moreTableView.delegate = self
        moreTableView.dataSource = self
        
        moreTableView.separatorStyle = .none
        
        moreTableViewData = [
            moreCellData(opened: false, label: "Number 1", sectionData: ["Cell 1-1", "Cell 1-2", "Cell 1-3"]),
            moreCellData(opened: false, label: "Number 2", sectionData: ["Cell 2-1", "Cell 2-2", "Cell 2-3"]),
            moreCellData(opened: false, label: "Number 3", sectionData: ["Cell 3-1", "Cell 3-2", "Cell 3-3"]),
            moreCellData(opened: false, label: "Number 4", sectionData: ["Cell 4-1", "Cell 4-2", "Cell 4-3"]),
            moreCellData(opened: false, label: "Number 5", sectionData: ["Cell 5-1", "Cell 5-2", "Cell 5-3"]),
            moreCellData(opened: false, label: "Number 1", sectionData: ["Cell 1-1", "Cell 1-2", "Cell 1-3"]),
            moreCellData(opened: false, label: "Number 2", sectionData: ["Cell 2-1", "Cell 2-2", "Cell 2-3"]),
            moreCellData(opened: false, label: "Number 3", sectionData: ["Cell 3-1", "Cell 3-2", "Cell 3-3"]),
            moreCellData(opened: false, label: "Number 4", sectionData: ["Cell 4-1", "Cell 4-2", "Cell 4-3"]),
            moreCellData(opened: false, label: "Number 5", sectionData: ["Cell 5-1", "Cell 5-2", "Cell 5-3"]),
        ]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return moreTableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if moreTableViewData[section].opened == true {
            return moreTableViewData[section].sectionData.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let moreCell = tableView.dequeueReusableCell(withIdentifier: "MoreTableViewCell") else {return UITableViewCell()}
            
            moreCell.textLabel?.text = moreTableViewData[indexPath.section].label
            
            return moreCell
        } else {
            guard let moreCell = tableView.dequeueReusableCell(withIdentifier: "MoreTableViewCell") else {return UITableViewCell()}
            
            moreCell.textLabel?.text = moreTableViewData[indexPath.section].sectionData[indexPath.row - 1]
            
            return moreCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if moreTableViewData[indexPath.section].opened == true {
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
