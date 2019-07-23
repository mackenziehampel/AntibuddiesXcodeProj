//
//  LambdaBase.swift
//  Antibuddies
//
//  Created by Ben Oliverson on 7/17/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import AWSLambda

class LambdaBase: NSObject {
    
    var object: NSManagedObject! = nil
    
    func downloadEntity(functionName: String, jsonRequest: [String: String]) -> Void {
        var jsonResponse: [String : Any] = [String : Any]()
        let lambda = AWSLambdaInvoker.default()
        lambda.invokeFunction(functionName, jsonObject: jsonRequest).continueWith(block: { (task) in
            if (task.result != nil){
                jsonResponse = task.result as! Dictionary<String, Any>
                self.persistData(item: jsonResponse)
            }
            return nil
        })
    }
    
    func upload(functionName: String, jsonRequest: [String:String], objectId: NSManagedObjectID) -> Void {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let lambda = AWSLambdaInvoker.default()
        
        lambda.invokeFunction(functionName, jsonObject: jsonRequest).continueWith(block: { (task) in
            
            if (task.result != nil){
                let id = Int32(task.result?.value(forKey: "ID") as? String ?? "0")
                
                self.object = context.object(with: objectId) as NSManagedObject
                
                (self.object as! Uploadable).serverKey = id ?? 0
                
                do {
                    try self.object.managedObjectContext?.save()
                } catch{
                    print("Unexpected error: \(error).")
                }
                
            }else{
                print("Error: \(String(describing: task.error))")
            }
            return nil
        })
    }
    
    func persistData(item: [String : Any]) -> Void {
        //Override to persist data
    }
}
