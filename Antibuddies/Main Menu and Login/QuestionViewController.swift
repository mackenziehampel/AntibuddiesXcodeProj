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

class QuestionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RadialButtonDelegate {
  
    @IBOutlet weak var explanationView: UIView!
    @IBOutlet weak var explanation: UILabel!
    @IBOutlet weak var backBtn: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var moveRight: UIButton!
    @IBOutlet weak var moveLeft: UIButton!
    @IBOutlet weak var question: UILabel!
    
    var selectedAnswer = ""
    var delegate: SelectedCorrectAnswer!
    var selectedIndex: IndexPath!
    var questionList = [PracticeQuestion]()
    var questionCount = 1
    var arrowEnabledColor = UIColor()
    var correctAnswer = Int()
    
    var testQuesitons = ["anti-Kna", "anit-Ch", "anti-Yka", "anti-Csa", "A REALLY REALLY long Answer to pick from A REALLY REALLY long Answer to pick fromA REALLY REALLY long Answer to pick from A REALLY REALLY long Answer to pick from A REALLY REALLY long Answer to pick from A REALLY REALLY long Answer to pick from antoher really long extra ssomthing on the end here A REALLY REALLY long Answer to pick from antoher really long extra ssomthing on the end her A REALLY REALLY long Answer to pick from antoher really long extra ssomthing on the end her A REALLY REALLY long Answer to pick from antoher really long extra ssomthing on the end her A REALLY REALLY long Answer to pick from antoher really long extra ssomthing on the end her A REALLY REALLY long Answer to pick from antoher really long extra ssomthing on the end her  A REALLY REALLY long Answer to pick from antoher really long extra ssomthing on the end her  A REALLY REALLY long Answer to pick from antoher really long extra ssomthing on the end her  A REALLY REALLY long Answer to pick from antoher really long extra ssomthing on the end her  A REALLY REALLY long Answer to pick from antoher really long extra ssomthing on the end her A REALLY REALLY long Answer to pick from antoher really long extra ssomthing on the end her A REALLY REALLY long Answer to pick from antoher really long extra ssomthing on the end her A REALLY REALLY long Answer to pick from antoher really long extra ssomthing on the end her"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
         self.tableView.register(UINib(nibName: "QuestionCell", bundle: nil), forCellReuseIdentifier: "QuestionCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.allowsSelection = false
        
        self.explanation.text = "REALLY LONG EXPLANATION,REALLY LONG EXPLANATION,REALLY LONG EXPLANATION,REALLY LONG EXPLANATION,REALLY LONG EXPLANATION,REALLY LONG EXPLANATION,REALLY LONG EXPLANATION,REALLY LONG EXPLANATION,REALLY LONG EXPLANATIONREALLY LONG EXPLANATION,REALLY LONG EXPLANATION,REALLY LONG EXPLANATION,REALLY LONG EXPLANATION,REALLY LONG EXPLANATION,REALLY LONG EXPLANATIONREALLY LONG EXPLANATION,REALLY LONG EXPLANATION,REALLY LONG EXPLANATION,REALLY LONG EXPLANATION,REALLY LONG EXPLANATION "
    
    
        explanationView.isHidden = true
        setQuestionAndExpalnationForView()  
     
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testQuesitons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionCell", for: indexPath) as! QuestionCell
        cell.question.text = testQuesitons[indexPath.row]
        cell.delegate = self
        
        if (selectedIndex != nil){
            if indexPath.row != selectedIndex.row {
                cell.bubble.backgroundColor = .clear
            } else {
                cell.bubble.backgroundColor = UIColor.init(red: (223.0/255.0), green: (168.0/255.0), blue: (1.0/255.0), alpha: 1.0)
            }
        }
       
        switch indexPath.row {
        case 0:
            
            if indexPath.row + 1 == Int(correctAnswer) {
                 cell.isCorrectAnswer = true
            } else {
                cell.isCorrectAnswer = false
            }
            cell.letter.text = "A."
           
        case 1:
            cell.letter.text = "B."
            if indexPath.row + 1 == Int(correctAnswer) {
                cell.isCorrectAnswer = true
            } else {
                cell.isCorrectAnswer = false
            }
        case 2:
            cell.letter.text = "C."
            if indexPath.row + 1 == Int(correctAnswer) {
                cell.isCorrectAnswer = true
            } else {
                cell.isCorrectAnswer = false
            }
        case 3:
            cell.letter.text = "D."
            if indexPath.row + 1 == Int(correctAnswer) {
                cell.isCorrectAnswer = true
            } else {
                cell.isCorrectAnswer = false
            }
        case 4:
            cell.letter.text = "E."
            if indexPath.row + 1 == Int(correctAnswer) {
                cell.isCorrectAnswer = true
            } else {
                cell.isCorrectAnswer = false
            }
        case 5:
            cell.letter.text = "F."
            if indexPath.row + 1 == Int(correctAnswer) {
                cell.isCorrectAnswer = true
            } else {
                cell.isCorrectAnswer = false
            }
        default:
            cell.letter.text = "X."
            if indexPath.row + 1 == Int(correctAnswer) {
                cell.isCorrectAnswer = true
            } else {
                cell.isCorrectAnswer = false
            }
            
        }
    
        return cell
    }
    
    @IBAction func didSelectBackBtn(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Hey!", message: "Are you sure you want to exit these practice questions?", preferredStyle: .alert)
        let action2 = UIAlertAction(title: "Get Brain Swole, I'll stay", style: .cancel) { (action:UIAlertAction) in
            
        }
        let action1 = UIAlertAction(title: "Exit, I make my own choices", style: .default) { (action:UIAlertAction) in
             self.dismiss(animated: true, completion: nil)
        }
        
        alertController.addAction(action2)
        alertController.addAction(action1)
    
        self.present(alertController, animated: true, completion: nil)
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    
    }
    
    func didSelectRadial(cell: QuestionCell, index: IndexPath) {
    
        if cell.isCorrectAnswer == true {
            self.explanationView.isHidden = false
        } else {
            self.explanationView.isHidden = true
        }
        selectedIndex = index
        tableView.reloadData()
    }
    
    
    func setQuestionAndExpalnationForView() {
        question.text = questionList[questionCount - 1].question // need to pass the questionCount index just incase it isn't always zero
        explanation.text = questionList[questionCount - 1].correctDescription
        correctAnswer = Int(questionList[questionCount - 1].correctAnswer)
        
        if questionCount - 1 <= 0 {
            moveLeft.isEnabled = false
            moveLeft.setTitleColor(.lightGray, for: .normal)
        }else {
            moveLeft.isEnabled = true
            moveLeft.setTitleColor(arrowEnabledColor, for: .normal)
        }
        if questionCount == questionList.count {
            moveRight.isEnabled = false
            moveRight.setTitleColor(.lightGray, for: .normal)
        } else {
            moveRight.isEnabled = true
            moveRight.setTitleColor(arrowEnabledColor, for: .normal)
        }
    }
    
    @IBAction func didSelectMoveLeft(_ sender: Any) {

            questionCount -= 1
            setQuestionAndExpalnationForView()
        
    }
    
    @IBAction func didSelectMoveRight(_ sender: Any) {
       
            questionCount += 1
            setQuestionAndExpalnationForView()
        
    }
    
}
