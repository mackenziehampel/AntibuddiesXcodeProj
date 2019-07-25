//
//  LoginUser.swift
//  Antibuddies
//
//  Created by Ben Oliverson on 7/23/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import Foundation

class LoginUser: LambdaBase {
    
    func loginRequest(username: String, password: String) -> Void {
        let loginData: [String: String] = ["username" : username, "password" : password]
        self.serverValidation(functionName: "loginUser", jsonRequest: loginData, type: 1)
    }
}
