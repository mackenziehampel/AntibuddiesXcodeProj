//
//  LambdaBase.swift
//  Antibuddies
//
//  Created by Ben Oliverson on 7/17/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import AWSLambda

class LambdaBase: NSObject {
    
    
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
    
    func persistData(item: [String : Any]) -> Void {
        //Override to persist data
    }
}
