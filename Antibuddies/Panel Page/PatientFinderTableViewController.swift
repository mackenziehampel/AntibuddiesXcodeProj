//
//  PatientFinderTableViewController.swift
//  Antibuddies
//
//  Created by Mackenzie Hampel on 7/8/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import Foundation
import UIKit

class PatientFinderTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var possiblePatientsArray = ["Patient 1", "Patient 2", "Patient 3", "Patient 4"] //[Paitents]
    var selectedIndexPath: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "PatientCell", bundle: nil), forCellReuseIdentifier: "PatientCell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return possiblePatientsArray.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PatientCell", for: indexPath) as! PatientCell
        cell.selectionStyle = .none
        selectedIndexPath = indexPath.row
        self.tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PatientCell", for: indexPath) as! PatientCell
        cell.patientNumber.text = possiblePatientsArray[indexPath.row]
        if indexPath.row == selectedIndexPath {
             cell.roundedView.backgroundColor = UIColor.init(red: (67.0/255.0), green: (150.0/255.0), blue: (77.0/255.0), alpha: 1.0)
        }else {
             cell.roundedView.backgroundColor = UIColor.init(red: (89.0/255.0), green: (89.0/255.0), blue: (89.0/255.0), alpha: 1.0)
        }
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    @IBAction func didSelectClose(_ sender: Any) {
      self.dismiss(animated: true, completion: nil)
    }
    
}
