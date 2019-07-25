//
//  MainMenuViewController.swift
//  Antibuddies
//
//  Created by Mackenzie Hampel on 5/28/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import Foundation
import UIKit

class MainMenuViewController: UIViewController {
    
    @IBOutlet weak var beginnerBtn: UIButton!
    @IBOutlet weak var intermediateBtn: UIButton!
    @IBOutlet weak var advancedBtn: UIButton!
    @IBOutlet weak var firstNameLbl: UILabel!
    
   // @IBOutlet weak var messageFromBeyond: UILabel!
    @IBOutlet weak var messageFromBeyone: UITextField!
    
    var currentUser: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let currentUserId = UserDefaults.standard.value(forKey: "CurrentUserId") as? Int32{
            currentUser = User.getUserWithId(userId: currentUserId)
            firstNameLbl.text = currentUser.firstName
        }
    }
    
    @IBAction func didselect(_ sender: Any) {
        
    }
   

    @IBAction func didSelectBeginner(_ sender: Any) {
        //this function is called when the user selects the Beginner Button in the Main Menu Storyboard and segues the user to the Beginner Panel View
        let storyboard: UIStoryboard = UIStoryboard(name: "PanelCollection", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PanelCollectionViewController") as! PanelCollectionViewController
        vc.level = "b"
        self.show(vc, sender: self)
        
    }
    
    @IBAction func didSelectBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func didSelectIntermediate(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "PanelCollection", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PanelCollectionViewController") as! PanelCollectionViewController
        vc.level = "i"
        self.show(vc, sender: self)
    }
    
    @IBAction func didSelectAdvanced(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "PanelCollection", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PanelCollectionViewController") as! PanelCollectionViewController
        vc.level = "a"
        self.show(vc, sender: self)
    }
}
