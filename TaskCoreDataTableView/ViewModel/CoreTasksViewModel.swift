//
//  CoreTasksViewController.swift
//  TaskCoreDataTableView
//
//  Created by Mac on 11/28/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit
import CoreData

class CoreTasksModelView:CoreViewModelProtocol {
    
    public private(set) var tasks:[Task] = []
    let container = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
    func addTask (textFieldText:String, priorityLevel:String){
        guard let manegedContext = container?.viewContext else{return}
        let taskObject = Task(context: manegedContext)
        taskObject.taskDescription = textFieldText
        taskObject.priorityLevel = priorityLevel
        appendTask(task: taskObject)
    }
    
    func appendTask(task:Task){
        tasks.append(task)
        
        guard let manegedContext = container?.viewContext else {
            return
        }
        saveManegedContext(manegedContext: manegedContext)
    }
    
    func fetchTasks( completion:(_ complete:Bool)->() ){
        guard  let manegedContext = container?.viewContext else {
            return
        }
        let className = String(describing: Task.self)
        let fetchRequest = NSFetchRequest<Task>(entityName: className)
        do{
            self.tasks = try manegedContext.fetch(fetchRequest)
            print("Successflly fetch data")
            completion(true)
        } catch {
            debugPrint("Could not catch \(error.localizedDescription)")
            completion(false)
        }
    }
    
    func removeTask(atIndexPath indexPath: IndexPath) {
      self.removeManegedObject(atIndexPath: indexPath, manegedContext: container?.viewContext, managedObjectsArray: self.tasks)
        
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
