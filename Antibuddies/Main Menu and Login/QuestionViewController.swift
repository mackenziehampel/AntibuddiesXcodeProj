//
//  QuestionViewController.swift
//  Antibuddies
//
//  Created by Mackenzie Hampel on 7/23/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import Foundation
import UIKit

protocol SelectedCorrectAnswer {
    func selectedCorrectAnswer(correctAnswer: Bool)
}

class QuestionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var explanationView: UIView!
    @IBOutlet weak var explaination: UILabel!
    @IBOutlet weak var backBtn: UIView!
    @IBOutlet weak var tableView: UITableView!
    var correctAnswer = true
    var delegate: SelectedCorrectAnswer!
    
    var testQuesitons = ["anti-Kna", "anit-Ch", "anti-Yka", "anti-Csa", "A REALLY REALLY long Answer to pick from A REALLY REALLY long Answer to pick fromA REALLY REALLY long Answer to pick from A REALLY REALLY long Answer to pick from A REALLY REALLY long Answer to pick from A REALLY REALLY long Answer to pick from antoher really long extra ssomthing on the end here"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
         self.tableView.register(UINib(nibName: "QuestionCell", bundle: nil), forCellReuseIdentifier: "QuestionCell")
        
        self.explaination.text = "REALLY LONG EXPLANATION,REALLY LONG EXPLANATION,REALLY LONG EXPLANATION,REALLY LONG EXPLANATION,REALLY LONG EXPLANATION,REALLY LONG EXPLANATION,REALLY LONG EXPLANATION,REALLY LONG EXPLANATION,REALLY LONG EXPLANATIONREALLY LONG EXPLANATION,REALLY LONG EXPLANATION,REALLY LONG EXPLANATION,REALLY LONG EXPLANATION,REALLY LONG EXPLANATION,REALLY LONG EXPLANATIONREALLY LONG EXPLANATION,REALLY LONG EXPLANATION,REALLY LONG EXPLANATION,REALLY LONG EXPLANATION,REALLY LONG EXPLANATION "
        
        
        explanationView.isHidden = true
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
    
    @IBAction func didSelectBackBtn(_ sender: Any) {
        
        
        let alertController = UIAlertController(title: "Hey!", message: "Are you sure you want to exit this practice exam?", preferredStyle: .alert)
        let action2 = UIAlertAction(title: "Get Brain Swole, I'll stay", style: .cancel) { (action:UIAlertAction) in
            
        }
        let action1 = UIAlertAction(title: "I make my own choices", style: .default) { (action:UIAlertAction) in
             self.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(action2)
        alertController.addAction(action1)
    
        self.present(alertController, animated: true, completion: nil)
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
//            delegate.selectedCorrectAnswer(correctAnswer: true)
//            
            self.explanationView.isHidden = false
        } else {
            self.explanationView.isHidden = true
        }
    }
    
    
}
