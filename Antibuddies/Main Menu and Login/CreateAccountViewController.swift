//
//  CreateAccountViewController.swift
//  Antibuddies
//
//  Created by Mackenzie Hampel on 6/3/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol CreateAccountDelegate {
    func accountCreated()
}

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    var delegate: CreateAccountDelegate?
    
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
        if userNameField.text != "" && passwordField.text != ""{
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let user = User.init(entity: NSEntityDescription.entity(forEntityName: "User", in: context)!, insertInto: context)
            user.firstName = self.firstNameField.text
            user.lastName = self.lastNameField.text
            user.username = self.userNameField.text
            do {
                try context.save()
            } catch{
                print("Unexpected error: \(error).")
            }
            DispatchQueue.global(qos: .background).async {
                let password = self.passwordField.text != nil ? (self.passwordField.text?.sha256())! : "No Password"
                user.syncWithServer(pass: password)
                DispatchQueue.main.async {
                    
                    self.dismiss(animated: true, completion: { () in
                        self.delegate?.accountCreated()
                    })
                }
            }
        } else {
            let alert = UIAlertController(title: "Almost There", message: "Please enter a username and password to create an account.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
}
