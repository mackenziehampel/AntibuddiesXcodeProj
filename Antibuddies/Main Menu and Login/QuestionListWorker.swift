//
//  QuestionListWorker.swift
//  Antibuddies
//
//  Created by Ben Oliverson on 8/9/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class QuestionListWorker {
    
    class func getPracticeQuestionsWithDifficulty(difficulty: Int) -> [PracticeQuestion] {
        var tempPQ = [PracticeQuestion]()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        tempPQ = EntityInteractor.getEntityWithPredicate(entityName: "PracticeQuestion", predicate: String(format: "difficulty = %d", difficulty), context: context) as! [PracticeQuestion]
        
        return tempPQ
    }
}
