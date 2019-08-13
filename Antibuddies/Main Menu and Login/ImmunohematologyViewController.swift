//
//  ImmunohematologyViewController.swift
//  Antibuddies
//
//  Created by Mackenzie Hampel on 7/9/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import Foundation
import UIKit

class ImmunohematologyViewController: UIViewController {
    
    @IBOutlet weak var PanelsButton: UIButton!
    @IBOutlet weak var PanelExamplesButton: UIButton!
    @IBOutlet weak var PracticeQuestionsButton: UIButton!
    @IBOutlet weak var heyImage: UIImageView!
    @IBOutlet weak var heyImageRightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PanelExamplesButton.isEnabled = false
          self.heyImageRightConstraint.constant = -320.0
        UIView.animate(withDuration: 0.50) {
            self.view.layoutIfNeeded()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            UIView.animate(withDuration: 1.0) {
                self.heyImageRightConstraint.constant = 0.0
                self.view.layoutIfNeeded()
            }
        })
    }
    @IBAction func didSelectPracticeQuestions(_ sender: Any) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "PracticeQuestionLevelSelectVC") as! PracticeQuestionLevelSelectVC
        self.present(nextViewController, animated:true, completion:nil)
        
        
    }
    @IBAction func didSelectBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
