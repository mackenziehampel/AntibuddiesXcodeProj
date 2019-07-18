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
        createUser(email: userNameTxt.text ?? "failed", password: passwordTxt.text ?? "failed")
        
    }
    
    
    func createUser(email: String, password: String){
        
        let headers = [
            "Content-Type": "application/json",
            "Cache-Control": "no-cache",
            "Authorization" : "your token"
        ]
        let parameters = [
            "email": email,
            "uid": "12"
            ] as [String : Any]
        
        let postData = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let request = NSMutableURLRequest(url: NSURL(string: "pulURLhere")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
        })
        
        dataTask.resume()
        
    }
    
    
    
}


