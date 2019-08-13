//
//  QuestionListViewController.swift
//  Antibuddies
//
//  Created by Mackenzie Hampel on 7/30/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.


import Foundation
import UIKit

class QuestionListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var tableView: UITableView!
    var selectedDifficulty = 0
    var practiceQuestions = [PracticeQuestion]()
    var sortedFirstName = [String]()
    var uniqueFirstNames = [String]()
    var firstNames = [String]()
    var sections = [[PracticeQuestion]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "QuestionListCell", bundle: nil), forCellReuseIdentifier: "QuestionListCell")
        self.tableView.register(UINib(nibName: "QuestionListHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "QuestionListHeader")
        self.tableView.tableFooterView = UIView()
        
        practiceQuestions = QuestionListWorker.getPracticeQuestionsWithDifficulty(difficulty: selectedDifficulty)
        print("TEST")
        refilterRowsAndSections()
       
    }
    
    func refilterRowsAndSections(){
        
        firstNames = practiceQuestions.map{ $0.section! }
        uniqueFirstNames = Array(Set(firstNames))
        sortedFirstName = uniqueFirstNames.sorted()
        sections = sortedFirstName.map{sectionHeader in return practiceQuestions
            .filter { $0.section == sectionHeader}
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       return sections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentQuestion = sections[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionListCell", for: indexPath) as! QuestionListCell
        let row = indexPath.row + 1
        cell.question.text = currentQuestion.question
        cell.questionNumber.text = row.description + "."
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let questionView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QuestionViewController") as! QuestionViewController
        //only pass section
        questionView.questionList = sections[indexPath.section]
        questionView.questionLbl?.text = String(format: "Question %@", indexPath.row + 1)
        questionView.questionCount = indexPath.row + 1
        self.present(questionView, animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
 
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "QuestionListHeader") as! QuestionListHeader
        headerView.sectionTitle.text = sortedFirstName[section]
        return headerView
    }
 
    @IBAction func didSelectBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
