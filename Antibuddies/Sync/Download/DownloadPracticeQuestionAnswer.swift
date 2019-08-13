//
//  DownloadPracticeQuestionAnswer.swift
//  Antibuddies
//
//  Created by Ben Oliverson on 8/12/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import UIKit
import CoreData

class DownloadPracticeQuestionAnswer: LambdaBase {
    
    func downloadPracticeQuestionAnswer(practiceQuestionId: Int32) -> Void {
        let practiceQuestionAnswerRequest: [String: String] = ["questionID" : String(describing: practiceQuestionId)]
        self.downloadEntity(functionName: "getPracticeQuestionAnswers", jsonRequest: practiceQuestionAnswerRequest)
    }
    
    override func persistData(item: [String : Any]) {
        
        if (item["PracticeQuestionAnswers"] == nil){
            saveDownloadedData(item: item)
        } else {
            let allPracticeQuestionAnswers = item["PracticeQuestionAnswers"] as! [[String:Any]]
            for answer in allPracticeQuestionAnswers{
                saveDownloadedData(item: answer)
            }
            NotificationCenter.default.post(name: .practiceQuestionAnswersDownloadedNotification, object: nil)
        }
        
    }
    
    func saveDownloadedData(item: [String:Any]) -> Void {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        guard let serverKey = Int32(item["id"] as? String ?? "0") else { return }
        
        var practiceA = EntityInteractor.getEntityWithId(entityName: "PracticeQuestionAnswer", entityId: serverKey, context: context) as? PracticeQuestionAnswer
        
        if practiceA == nil {
            practiceA = PracticeQuestionAnswer.init(entity: NSEntityDescription.entity(forEntityName: "PracticeQuestionAnswer", in: context)!, insertInto: context)
        }
        
        practiceA?.serverKey = serverKey
        practiceA?.answer = item["correctAnswer"] as? String
        practiceA?.order = Int16(item["answerNum"] as? String ?? "0")!
        
        do {
            try context.save()
        } catch{
            print("Unexpected error: \(error).")
        }
    }
    
}
