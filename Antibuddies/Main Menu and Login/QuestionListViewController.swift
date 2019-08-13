//
//  QuestionListViewController.swift
//  Antibuddies
//
//  Created by Mackenzie Hampel on 7/30/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.


import Foundation
import UIKit

class QuestionListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DismissDelegate {
    
    
  
    @IBOutlet weak var tableView: UITableView!
    var selectedDifficulty = 0
    var practiceQuestions = [PracticeQuestion]()
    var sortedFirstName = [String]()
    var uniqueFirstNames = [String]()
    var firstNames = [String]()
    var sections = [[PracticeQuestion]]()
    var selectedQuestion: PracticeQuestion? = nil
    var selectedQuestionAnswers = [PracticeQuestionAnswer]()
    var selectedIndex: Int = 0
    
    let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
    var blurEffectView: UIVisualEffectView!
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "QuestionListCell", bundle: nil), forCellReuseIdentifier: "QuestionListCell")
        self.tableView.register(UINib(nibName: "QuestionListHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "QuestionListHeader")
        self.tableView.tableFooterView = UIView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(showQuestion(notification:)), name: .practiceQuestionAnswersDownloadedNotification, object: nil)
        
        practiceQuestions = QuestionListWorker.getPracticeQuestionsWithDifficulty(difficulty: selectedDifficulty)
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
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        startActivityIndicator(blur: blurEffectView, ai: activityIndicator)
        
        selectedQuestion = sections[indexPath.section][indexPath.row]
        selectedIndex = sections.indices(of: selectedQuestion!)!
        
        selectedQuestionAnswers = EntityInteractor.getEntityWithPredicate(entityName: "PracticeQuestionAnswer", predicate: String(format: "practiceQuestion.serverKey = %d", self.selectedQuestion!.serverKey), context: context) as! [PracticeQuestionAnswer]
        
        if selectedQuestionAnswers.count > 0 {
            self.showQuestionDetailVC()
        } else {
            DispatchQueue.global(qos: .background).async {
                let DPQA = DownloadPracticeQuestionAnswer()
                DPQA.downloadPracticeQuestionAnswer(practiceQuestionId: self.selectedQuestion!.serverKey)
            }
        }
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
    func dismissView() {
        self.dismiss(animated: false, completion: nil)
    }
    
    @objc func showQuestion(notification: Notification) -> Void {
        DispatchQueue.main.async {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            self.selectedQuestionAnswers = EntityInteractor.getEntityWithPredicate(entityName: "PracticeQuestionAnswer", predicate: String(format: "practiceQuestion.serverKey = %d", self.selectedQuestion!.serverKey), context: context) as! [PracticeQuestionAnswer]
            
            self.showQuestionDetailVC()
        }
        
    }
    
    func showQuestionDetailVC() -> Void {
        self.stopActivityIndicator(blur: self.blurEffectView, ai: self.activityIndicator)
        let questionView = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QuestionViewController") as! QuestionViewController
        //only pass section
        questionView.questionList = practiceQuestions
        questionView.questionCount = selectedIndex
        questionView.testQuesitonAnswers = selectedQuestionAnswers
        self.present(questionView, animated: true, completion: nil)
    }
    
}
