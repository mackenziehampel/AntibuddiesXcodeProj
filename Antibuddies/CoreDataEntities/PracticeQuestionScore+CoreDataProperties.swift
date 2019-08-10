//
//  PracticeQuestionScore+CoreDataProperties.swift
//  Antibuddies
//
//  Created by Ben Oliverson on 8/9/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//
//

import Foundation
import CoreData


extension PracticeQuestionScore {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PracticeQuestionScore> {
        return NSFetchRequest<PracticeQuestionScore>(entityName: "PracticeQuestionScore")
    }

    @NSManaged public var completed: Bool
    @NSManaged public var correct: Bool
    @NSManaged public var serverKey: Int32
    @NSManaged public var practiceQuestion: PracticeQuestion?
    @NSManaged public var user: User?

}
