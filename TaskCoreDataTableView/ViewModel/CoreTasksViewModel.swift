//
//  CoreTasksViewController.swift
//  TaskCoreDataTableView
//
//  Created by Mac on 11/28/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit
import CoreData

class CoreTasksModelView : CoreViewModelGeneric<Task> {
   
    
    func addTask (textFieldText:String, priorityLevel:TaskPriority){
        guard let manegedContext = container?.viewContext else{return}
        let taskObject = Task(context: manegedContext)
        taskObject.taskDescription = textFieldText
        taskObject.priorityLevel = priorityLevel
        appendCoreObject(coreObject: taskObject)
    }

    
    
    func set(employee:Employee,for task:Task){
        task.emloyee = employee
        //employee.addToTasks(task)
        guard let manegedContext = container?.viewContext else {
            return
        }
        self.saveManegedContext(manegedContext: manegedContext)
    }
    func unset(task:Task){
        task.emloyee = nil
    }
    


}
