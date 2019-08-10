//
//  QuestionListViewController.swift
//  Antibuddies
//
//  Created by Mackenzie Hampel on 7/30/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import Foundation
import UIKit

class QuestionListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var tableView: UITableView!
    var selectedDifficulty = 0
    var practiceQuestions = [PracticeQuestion]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "QuestionListCell", bundle: nil), forCellReuseIdentifier: "QuestionListCell")
        self.tableView.register(UINib(nibName: "QuestionListHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "QuestionListHeader")
        
        practiceQuestions = QuestionListWorker.getPracticeQuestionsWithDifficulty(difficulty: selectedDifficulty)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionListCell", for: indexPath) as! QuestionListCell
        
        let row = indexPath.row + 1
        cell.questionNumber.text = row.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let questionView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QuestionViewController") as! QuestionViewController
        
        self.present(questionView, animated: true, completion: nil)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
 
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "QuestionListHeader") as! QuestionListHeader
        headerView.sectionTitle.text = "Section \(section)"
        return headerView
    }
 
    
    @IBAction func didSelectBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
