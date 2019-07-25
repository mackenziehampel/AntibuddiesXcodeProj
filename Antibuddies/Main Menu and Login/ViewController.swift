//
//  ViewController.swift
//  Antibuddies
//
//  Created by Mackenzie Hampel on 5/16/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import UIKit


class ViewController: UIViewController, LambdaBoolResponse {
 
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    var currentUserId: Int32 = 0
    
    let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
    var blurEffectView: UIVisualEffectView!
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        GIDSignIn.sharedInstance().uiDelegate = self
//        GIDSignIn.sharedInstance().signIn()
//
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
    }
    
    
    @IBAction func didSelectLogin(_ sender: Any) {
        
        if (userNameTxt.text != nil && userNameTxt.text != "" && passwordTxt.text != nil && passwordTxt.text != "") {
            blurEffectView = UIVisualEffectView(effect: blurEffect)
            startActivityIndicator(blur: blurEffectView, ai: activityIndicator)
            let username = userNameTxt.text!
            guard let password = passwordTxt.text?.sha256() else { return }
            DispatchQueue.global(qos: .background).async {
                let LU = LoginUser()
                LU.loginDelegate = self
                LU.loginRequest(username: username, password: password)
            }
        } else {
            let alert = UIAlertController(title: "Alomst There...", message: "Please enter your username and password to sign in.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func showUsedUsernameAlert() {} //Implemented in another class
    
    func userAuthenticationResponse(response: Bool, userId: Int32) {
        
        currentUserId = userId
        let user = User.getUserWithId(userId: userId)
        if user == nil{
            let DU = DownloadUser()
            DU.downloadUser(userId: userId)
        } else {
            DispatchQueue.main.async {
                UserDefaults.standard.set(userId, forKey: "CurrentUserId")
                self.stopActivityIndicator(blur: self.blurEffectView, ai: self.activityIndicator)
                if response{
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let controller = storyboard.instantiateViewController(withIdentifier: "SelectCourseViewController") as! SelectCourseViewController
                    self.present(controller, animated: true, completion: nil)
                } else {
                    let alert = UIAlertController(title: "Oh No...", message: "Your username or password was not found. Please try again or create a new account.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: {(action) in
                        self.passwordTxt.text = ""
                    }))
                    
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
    }

    
    
}


