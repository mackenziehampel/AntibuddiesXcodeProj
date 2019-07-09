//
//  PanelViewController.swift
//  Antibuddies
//
//  Created by Mackenzie Hampel on 6/4/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import Foundation
import UIKit


class PanelViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource, buttonTapped {
   
  @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "PanelCell", bundle: nil), forCellReuseIdentifier: "PanelCell")
        self.tableView.register(UINib(nibName: "PanelMainCell", bundle: nil), forCellReuseIdentifier: "PanelMainCell")
        tableView.backgroundView?.backgroundColor = .clear
       // tableView.allowsSelection = false;
    }
    @IBAction func didSelectBack(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PanelCell", for: indexPath) as! PanelCell
           
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PanelMainCell", for: indexPath) as! PanelMainCell
            cell.greyNumberLbl.text = indexPath.row.description
            cell.delegate = self
            return cell
        }
        
        
    }
    
    func buttonTapped(cell: PanelMainCell, buttonColumn: String) {
        //send in button
        //button.titleLabel?.text = "/"
        switch buttonColumn {
        case "D":
            //programmatically add
            cell.D.titleLabel!.text = "/"
            break
        case "BigC":
            cell.bigC.titleLabel?.text = "/"
            break
        case "LittleC":
            cell.littleC.titleLabel?.text = "/"
            break
        case "LittleE":
            cell.littleE.titleLabel?.text = "/"
            break
        case "BigE":
            cell.bigE.titleLabel?.text = "/"
            break
        default:
            break
        }
        print("made it")
    }
}
