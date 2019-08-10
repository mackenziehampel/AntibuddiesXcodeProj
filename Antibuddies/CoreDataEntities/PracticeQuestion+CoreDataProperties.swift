//
//  PracticeQuestion+CoreDataProperties.swift
//  Antibuddies
//
//  Created by Ben Oliverson on 8/9/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//
//

import Foundation
import CoreData


extension PracticeQuestion {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PracticeQuestion> {
        return NSFetchRequest<PracticeQuestion>(entityName: "PracticeQuestion")
    }

    @NSManaged public var correctAnswer: Int16
    @NSManaged public var correctDescription: String?
    @NSManaged public var difficulty: Int16
    @NSManaged public var question: String?
    @NSManaged public var section: String?
    @NSManaged public var serverKey: Int32
    @NSManaged public var answers: PracticeQuestionAnswer?
    @NSManaged public var courseItem: NSSet?
    @NSManaged public var questionScore: PracticeQuestionScore?

}

// MARK: Generated accessors for courseItem
extension PracticeQuestion {

    @objc(addCourseItemObject:)
    @NSManaged public func addToCourseItem(_ value: CourseItem)

    @objc(removeCourseItemObject:)
    @NSManaged public func removeFromCourseItem(_ value: CourseItem)

    @objc(addCourseItem:)
    @NSManaged public func addToCourseItem(_ values: NSSet)

    @objc(removeCourseItem:)
    @NSManaged public func removeFromCourseItem(_ values: NSSet)

}
