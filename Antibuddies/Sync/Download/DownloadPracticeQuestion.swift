//
//  DownloadPracticeQuestion.swift
//  Antibuddies
//
//  Created by Ben Oliverson on 8/8/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import CoreData
import UIKit

class DownloadPracticeQuestion: LambdaBase {
    
    func downloadPracticeQuestion(courseID: Int32, difficulty: Int) -> Void {
        let practiceQuestionRequest: [String: String] = ["courseID" : String(describing: courseID), "difficulty" : String(describing: difficulty)]
        self.downloadEntity(functionName: "getPracticeQuestions", jsonRequest: practiceQuestionRequest)
    }
    
    override func persistData(item: [String : Any]) {
        
        if (item["PracticeQuestions"] == nil){
            saveDownloadedData(item: item)
        } else {
            let allPracticeQuestions = item["PracticeQuestions"] as! [[String:Any]]
            for practiceQuestion in allPracticeQuestions{
                saveDownloadedData(item: practiceQuestion)
            }
            NotificationCenter.default.post(name: .practiceQuestionsDownloadedNotification, object: nil)
        }
        
    }
    
    func saveDownloadedData(item: [String:Any]) -> Void {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        guard let serverKey = Int32(item["id"] as? String ?? "0") else { return }
        
        var practiceQ = EntityInteractor.getEntityWithId(entityName: "PracticeQuestion", entityId: serverKey, context: context) as? PracticeQuestion
        
        if practiceQ == nil {
            practiceQ = PracticeQuestion.init(entity: NSEntityDescription.entity(forEntityName: "PracticeQuestion", in: context)!, insertInto: context)
        }
        
        practiceQ?.serverKey = serverKey
        practiceQ?.section = item["section"] as? String
        practiceQ?.question = item["question"] as? String
        practiceQ?.difficulty = Int16(item["difficulty"] as? String ?? "0")!
        practiceQ?.correctAnswer = Int16(item["correctAnswer"] as? String ?? "0")!
        practiceQ?.correctDescription = item["answerDesc"] as? String
        
        do {
            try context.save()
        } catch{
            print("Unexpected error: \(error).")
        }
    }
    
}


