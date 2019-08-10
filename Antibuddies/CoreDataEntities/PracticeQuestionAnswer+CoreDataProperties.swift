//
//  PracticeQuestionAnswer+CoreDataProperties.swift
//  Antibuddies
//
//  Created by Ben Oliverson on 8/9/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//
//

import Foundation
import CoreData


extension PracticeQuestionAnswer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PracticeQuestionAnswer> {
        return NSFetchRequest<PracticeQuestionAnswer>(entityName: "PracticeQuestionAnswer")
    }

    @NSManaged public var answer: String?
    @NSManaged public var order: Int16
    @NSManaged public var serverKey: Int32
    @NSManaged public var practiceQuestion: PracticeQuestion?

}
