//
//  MainMenuViewController.swift
//  Antibuddies
//
//  Created by Mackenzie Hampel on 5/28/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase
import FirebaseFunctions

class MainMenuViewController: UIViewController {
    
    @IBOutlet weak var beginnerBtn: UIButton!
    @IBOutlet weak var intermediateBtn: UIButton!
    @IBOutlet weak var advancedBtn: UIButton!
    lazy var functions = Functions.functions()
    @IBOutlet weak var firstNameLbl: UILabel!
    
    var ref:DatabaseReference = Database.database().reference()
    
   // @IBOutlet weak var messageFromBeyond: UILabel!
    @IBOutlet weak var messageFromBeyone: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
//                functions.httpsCallable("helloWorldCallable").call(["data":"test"]) { (result, error) in
//                    if let error = error as NSError? {
//                        if error.domain == FunctionsErrorDomain {
//                            let code = FunctionsErrorCode(rawValue: error.code)
//                            let message = error.localizedDescription
//                            let details = error.userInfo[FunctionsErrorDetailsKey]
//                            print("CODE:",code!, "  ", "MESSAGE:", message,"   ", "DETAILS:" ,details! )
//                        }
//                        // ...
//                    }
//                    if let text = (result?.data as? [String: Any])?["data"] as? String {
//
//                    }
//        }
        

        functions.httpsCallable("getUserCallable").call(["firstName": "Sally"]) { (result, error) in
            if let error = error as NSError? {
                if error.domain == FunctionsErrorDomain {
                    let code = FunctionsErrorCode(rawValue: error.code)
                    let message = error.localizedDescription
                    let details = error.userInfo[FunctionsErrorDetailsKey]
                    print("CODE:",code!, "  ", "MESSAGE:", message,"   ", "DETAILS:" ,details! )
                }
                // ...
            }


            if let text = (result?.data as? [String: Any])?["firstName"] as? String { //user.firstName
               // self.firstNameLbl.text =
               
            }
        }

       
    }
    
    @IBAction func didselect(_ sender: Any) {
        
        ref.child("User").setValue("A.Lincoln")
        
        

//        functions.httpsCallable("helloWorldCallable").call(["data": self.messageFromBeyone.text]) { (result, error) in
//            if let error = error as NSError? {
//                if error.domain == FunctionsErrorDomain {
//                    let code = FunctionsErrorCode(rawValue: error.code)
//                    let message = error.localizedDescription
//                    let details = error.userInfo[FunctionsErrorDetailsKey]
//                    print("CODE:",code!, "  ", "MESSAGE:", message,"   ", "DETAILS:" ,details! )
//                }
//                // ...
//            }

        
    }
//        functions.httpsCallable("helloWorldCallable").call(["data":"test"]) { (result, error) in
//            if let error = error as NSError? {
//                if error.domain == FunctionsErrorDomain {
//                    let code = FunctionsErrorCode(rawValue: error.code)
//                    let message = error.localizedDescription
//                    let details = error.userInfo[FunctionsErrorDetailsKey]
//                    print("CODE:",code!, "  ", "MESSAGE:", message,"   ", "DETAILS:" ,details! )
//                }
//                // ...
//            }
//            if let text = (result?.data as? [String: Any])?["data"] as? String {
//                self.messageFromBeyone.text = text
//            }
   

    @IBAction func didSelectBeginner(_ sender: Any) {
        //this function is called when the user selects the Beginner Button in the Main Menu Storyboard and segues the user to the Beginner Panel View
        let storyboard: UIStoryboard = UIStoryboard(name: "PanelCollection", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PanelCollectionViewController") as! PanelCollectionViewController
        self.show(vc, sender: self)
        
    }
    
    @IBAction func didSelectBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func didSelectIntermediate(_ sender: Any) {
        
    }
    
    @IBAction func didSelectAdvanced(_ sender: Any) {
        
    }
}
