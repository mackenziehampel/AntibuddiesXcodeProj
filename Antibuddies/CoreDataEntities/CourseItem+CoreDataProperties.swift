//
//  CourseItem+CoreDataProperties.swift
//  Antibuddies
//
//  Created by Ben Oliverson on 8/9/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//
//

import Foundation
import CoreData


extension CourseItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CourseItem> {
        return NSFetchRequest<CourseItem>(entityName: "CourseItem")
    }

    @NSManaged public var createdBy: String?
    @NSManaged public var createdOn: NSDate?
    @NSManaged public var serverKey: Int32
    @NSManaged public var type: Int16
    @NSManaged public var course: Course?
    @NSManaged public var practiceQuestions: NSSet?

}

// MARK: Generated accessors for practiceQuestions
extension CourseItem {

    @objc(addPracticeQuestionsObject:)
    @NSManaged public func addToPracticeQuestions(_ value: PracticeQuestion)

    @objc(removePracticeQuestionsObject:)
    @NSManaged public func removeFromPracticeQuestions(_ value: PracticeQuestion)

    @objc(addPracticeQuestions:)
    @NSManaged public func addToPracticeQuestions(_ values: NSSet)

    @objc(removePracticeQuestions:)
    @NSManaged public func removeFromPracticeQuestions(_ values: NSSet)

}
