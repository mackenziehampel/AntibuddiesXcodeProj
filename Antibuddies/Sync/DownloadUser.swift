//
//  DownloadUser.swift
//  Antibuddies
//
//  Created by Ben Oliverson on 7/17/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import UIKit
import CoreData

class DownloadUser: LambdaBase {
    
    func downloadUser(userId: Int32) -> Void {
        let userRequest: [String: String] = ["ID" : String(describing: userId)]
        self.downloadEntity(functionName: "getUserWithId", jsonRequest: userRequest)
    }
    
    /*
     {
     "firstName": "Bill",        (Type: String)
     "lastName": "Bob",          (Type: String)
     "preferredName": "Billy",   (Type: String)
     "phone": "385-375-9774",    (Type: String)
     "email": "bill@gmail.com",  (Type: String)
     }
     */
    override func persistData(item: [String : Any]) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        guard let serverKey = Int32(item["ID"] as? String ?? "0") else { return }
        
        var user = EntityInteractor.getEntityWithId(entityName: "User", entityId: serverKey, context: context) as? User
        
        if user == nil {
            user = User.init(entity: NSEntityDescription.entity(forEntityName: "User", in: context)!, insertInto: context)
        }
        user?.serverKey = serverKey
        user?.firstName = item["firstName"] as? String
        user?.lastName = item["lastName"] as? String
        user?.username = item["username"] as? String
        
        do {
            try context.save()
        } catch{
            print("Unexpected error: \(error).")
        }
        //NotificationCenter.default.post(name: .userDownloadedNotification, object: nil)
    }
}
