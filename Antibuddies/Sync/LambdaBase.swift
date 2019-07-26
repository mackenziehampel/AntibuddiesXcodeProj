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
    var validateUsernameDelegate: LambdaBoolResponse?
    var loginDelegate: LambdaBoolResponse?
    
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
                
                if self.object.isKind(of: User.self){
                    UserDefaults.standard.set(id, forKey: "CurrentUserId")
                }
                
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
    
    func serverValidation(functionName: String, jsonRequest: [String:String], type: Int) -> Void {
        var lambdaResponse = false
        
        let lambda = AWSLambdaInvoker.default()
        lambda.invokeFunction(functionName, jsonObject: jsonRequest).continueWith(block: { (task) in
            if (task.result != nil){
                let json = task.result as! Dictionary<String, Any>
                let result = json["response"] ?? 0
                let respResult = String(describing: result)
                lambdaResponse = respResult.boolValue ?? false
                switch type{
                case 0:
                    if lambdaResponse{
                        self.validateUsernameDelegate?.showUsedUsernameAlert()
                    }
                    break
                case 1:
                    let id = Int32(task.result?.value(forKey: "ID") as? String ?? "0")
                    self.loginDelegate?.userAuthenticationResponse(response: lambdaResponse, userId: id!)
                    break
                default:
                    self.validateUsernameDelegate?.showUsedUsernameAlert()
                }
            }
            return nil
        })
    }
    
    func persistData(item: [String : Any]) -> Void {
        //Override to persist data
    }
}
