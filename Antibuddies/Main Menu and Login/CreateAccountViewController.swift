//
//  CreateAccountViewController.swift
//  Antibuddies
//
//  Created by Mackenzie Hampel on 6/3/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import Foundation
import UIKit

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.passwordField.isSecureTextEntry = true
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
         self.view.addGestureRecognizer(tap)
    }
    override func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    @IBAction func didSelectCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didSelectCreateAccount(_ sender: Any) {
    
        
    }
    
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
