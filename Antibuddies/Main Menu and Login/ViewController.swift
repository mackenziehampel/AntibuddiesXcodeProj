//
//  ViewController.swift
//  Antibuddies
//
//  Created by Mackenzie Hampel on 5/16/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
 
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        GIDSignIn.sharedInstance().uiDelegate = self
//        GIDSignIn.sharedInstance().signIn()
//
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
    }
    
    
    @IBAction func didSelectLogin(_ sender: Any) {
        
        var DU = DownloadUser()
        DU.downloadUser(userId: 1)
    }
    
    
    func createUser(email: String, password: String){
        
        
        
    }
    
    
    
}


