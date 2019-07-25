//
//  QuestionViewController.swift
//  Antibuddies
//
//  Created by Mackenzie Hampel on 7/23/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import Foundation
import UIKit

class QuestionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var testQuesitons = ["anti-Kna", "anit-Ch", "anti-Yka", "anti-Csa", "A REALLY REALLY long Answer to pick from A REALLY REALLY long Answer to pick fromA REALLY REALLY long Answer to pick from A REALLY REALLY long Answer to pick from A REALLY REALLY long Answer to pick from A REALLY REALLY long Answer to pick from antoher really long extra ssomthing on the end here"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
         self.tableView.register(UINib(nibName: "QuestionCell", bundle: nil), forCellReuseIdentifier: "QuestionCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testQuesitons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
        cell.question.text = testQuesitons[indexPath.row]
        
        switch indexPath.row {
        case 0:
            cell.letter.text = "A."
        case 1:
            cell.letter.text = "B."
        case 2:
            cell.letter.text = "C."
        case 3:
            cell.letter.text = "D."
        case 4:
            cell.letter.text = "E."
        case 5:
            cell.letter.text = "F."
        default:
            cell.letter.text = "X."
            
        }
        
        
        
        return cell
    }
    
}
