//
//  Task.swift
//  TaskCoreDataTableView
//
//  Created by Mac on 11/28/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit
import CoreData

class Task: NSManagedObject {
    // var priorityLevelValue:Int32
    var priorityLevel: TaskPriority {
        get {
            return TaskPriority(rawValue: self.priorityLevelValue)!
        }
        set {
            self.priorityLevelValue = newValue.rawValue
        }
    }
    
}

