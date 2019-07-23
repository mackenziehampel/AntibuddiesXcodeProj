//
//  InsertUser.swift
//  Antibuddies
//
//  Created by Ben Oliverson on 7/18/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

class InsertUser: LambdaBase {
    
    func createUserDictionary(user: User, pass: String){
        let userDictionary : [String:String] = ["firstName" : user.firstName ?? "iChino",
                                                "lastName" : user.lastName ?? "3750Class",
                                                "username" : user.username ?? "Ben",
                                                "pass" : pass]
        
        self.upload(functionName: "createUser", jsonRequest: userDictionary, objectId: user.objectID)
    }
}
