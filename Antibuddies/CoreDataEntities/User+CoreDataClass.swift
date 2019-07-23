//
//  User+CoreDataClass.swift
//  Antibuddies
//
//  Created by Ben Oliverson on 7/17/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//
//

import Foundation
import CoreData

struct CurrentUser {
    static var user: User?
}

@objc(User)
public class User: NSManagedObject {
    
    func syncWithServer(pass: String) -> Void /*Maybe change this to bool later*/ {
        if self.serverKey == 0 {
            let IU = InsertUser()
            IU.createUserDictionary(user: self, pass: pass)
        }
    }

}
