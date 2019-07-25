//
//  ViewController.swift
//  Antibuddies
//
//  Created by Mackenzie Hampel on 5/16/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    var originalConstraint = CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTxt.delegate = self
        passwordTxt.delegate = self
        originalConstraint = self.topConstraint.constant 
//        GIDSignIn.sharedInstance().uiDelegate = self
//        GIDSignIn.sharedInstance().signIn()
//
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.topConstraint.constant = 70.0
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.topConstraint.constant = originalConstraint
    }
    
    @IBAction func didSelectUserName(_ sender: Any) {
        
        
    }
    
    @IBAction func didSelectLogin(_ sender: Any) {
        
        let DU = DownloadUser()
        DU.downloadUser(userId: 1)
    }
    
    
    func createUser(email: String, password: String){
        
    }
    
}


