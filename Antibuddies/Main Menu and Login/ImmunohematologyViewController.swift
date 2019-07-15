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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PanelExamplesButton.isEnabled = false
        PracticeQuestionsButton.isEnabled = false
        
    }
}
