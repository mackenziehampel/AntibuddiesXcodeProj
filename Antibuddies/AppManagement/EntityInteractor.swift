//
//  EntityInteractor.swift
//  Antibuddies
//
//  Created by Ben Oliverson on 7/17/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class EntityInteractor: NSObject {
    
    class func getEntityWithId(entityName: String, entityId: Int32, context: NSManagedObjectContext) -> Any {
        let request = NSFetchRequest<NSFetchRequestResult>.init()
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)
        request.entity = entity
        let predicate = NSPredicate.init(format: "serverKey = %d", entityId)
        request.predicate = predicate
        
        var result: Any = ()
        var items: [Any] = []
        
        context.persistentStoreCoordinator?.performAndWait {
            do{
                items = try context.fetch(request)
            }catch{
                print(error)
            }
        }
        
        if items.count > 0 {
            result = items[0]
        }
        return result
    }
    
    class func getEntityWithPredicate(entityName: String, predicate: String, context: NSManagedObjectContext) -> Any {
        let request = NSFetchRequest<NSFetchRequestResult>.init()
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: context)
        request.entity = entity
        let predicate = NSPredicate.init(format: predicate)
        request.predicate = predicate
        
        var items: [Any] = []
        
        context.persistentStoreCoordinator?.performAndWait {
            do{
                items = try context.fetch(request)
            }catch{
                print(error)
            }
        }
        
        return items
    }
    
}
