//
//  Protocols.swift
//  Antibuddies
//
//  Created by Ben Oliverson on 7/18/19.
//  Copyright © 2019 WeberStateUniversity. All rights reserved.
//

import Foundation
import CoreData

protocol Uploadable: NSObject{
    var serverKey: Int32 {get set}
}
