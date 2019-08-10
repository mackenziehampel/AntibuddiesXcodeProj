//
//  PracticeQuestionLevelSelectVC.swift
//  Antibuddies
//
//  Created by Mackenzie Hampel on 7/23/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import Foundation
import UIKit

class PracticeQuestionLevelSelectVC: UIViewController {
    
    let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
    var blurEffectView: UIVisualEffectView!
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
    var selectedDifficulty = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
         NotificationCenter.default.addObserver(self, selector: #selector(showQuestionListVC(notification:)), name: .practiceQuestionsDownloadedNotification, object: nil)
    }
    
    @IBAction func didSelectBeginner(_ sender: Any) {
        selectedDifficulty = 1
        self.downloadQuestionsForDifficulty(difficulty: selectedDifficulty)
    }
    @IBAction func didSelectIntermediate(_ sender: Any) {
        selectedDifficulty = 2
        self.downloadQuestionsForDifficulty(difficulty: selectedDifficulty)
    }
    @IBAction func didSelectAdvanced(_ sender: Any) {
        selectedDifficulty = 3
        self.downloadQuestionsForDifficulty(difficulty: selectedDifficulty)
    }
    
    func downloadQuestionsForDifficulty(difficulty: Int) -> Void {
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        startActivityIndicator(blur: blurEffectView, ai: activityIndicator)
        
        //TODO: Set Current Course in UserDefaults, then pull it and use it in the courseID
        
        DispatchQueue.global(qos: .background).async {
            let DPQ = DownloadPracticeQuestion()
            DPQ.downloadPracticeQuestion(courseID: 1, difficulty: difficulty)
        }
        
    }
    
    @objc func showQuestionListVC(notification: Notification) -> Void {
        DispatchQueue.main.async {
            self.stopActivityIndicator(blur: self.blurEffectView, ai: self.activityIndicator)

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let controller = storyboard.instantiateViewController(withIdentifier: "QuestionListViewController") as! QuestionListViewController
            controller.selectedDifficulty = self.selectedDifficulty
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    @IBAction func didSelectBack(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
