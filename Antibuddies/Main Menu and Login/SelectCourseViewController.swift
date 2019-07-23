//
//  SelectCourseViewController.swift
//  Antibuddies
//
//  Created by Mackenzie Hampel on 7/9/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import Foundation
import UIKit

class SelectCourseViewController: UIViewController {
    @IBOutlet weak var ImmunohemtologyButton: UIButton!
    @IBOutlet weak var Hemotology: UIButton!
    @IBOutlet weak var ChemistryButton: UIButton!
    @IBOutlet weak var MicrobiologyButton: UIButton!
    @IBOutlet weak var ImmunologyButton: UIButton!
    @IBOutlet weak var UrinalysisButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            //if creating a new course delete the corresponding "isEnabled"
       Hemotology.isEnabled = false
        ChemistryButton.isEnabled = false
        MicrobiologyButton.isEnabled = false
        ImmunologyButton.isEnabled = false
        UrinalysisButton.isEnabled = false
    
        
    }
    @IBAction func didSelectBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
