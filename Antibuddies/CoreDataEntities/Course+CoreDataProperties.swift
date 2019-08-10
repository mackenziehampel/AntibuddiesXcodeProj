//
//  Course+CoreDataProperties.swift
//  Antibuddies
//
//  Created by Ben Oliverson on 8/9/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//
//

import Foundation
import CoreData


extension Course {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Course> {
        return NSFetchRequest<Course>(entityName: "Course")
    }

    @NSManaged public var name: String?
    @NSManaged public var serverKey: Int32
    @NSManaged public var classes: NSSet?
    @NSManaged public var courseItems: NSSet?

}

// MARK: Generated accessors for classes
extension Course {

    @objc(addClassesObject:)
    @NSManaged public func addToClasses(_ value: Class)

    @objc(removeClassesObject:)
    @NSManaged public func removeFromClasses(_ value: Class)

    @objc(addClasses:)
    @NSManaged public func addToClasses(_ values: NSSet)

    @objc(removeClasses:)
    @NSManaged public func removeFromClasses(_ values: NSSet)

}

// MARK: Generated accessors for courseItems
extension Course {

    @objc(addCourseItemsObject:)
    @NSManaged public func addToCourseItems(_ value: CourseItem)

    @objc(removeCourseItemsObject:)
    @NSManaged public func removeFromCourseItems(_ value: CourseItem)

    @objc(addCourseItems:)
    @NSManaged public func addToCourseItems(_ values: NSSet)

    @objc(removeCourseItems:)
    @NSManaged public func removeFromCourseItems(_ values: NSSet)

}
