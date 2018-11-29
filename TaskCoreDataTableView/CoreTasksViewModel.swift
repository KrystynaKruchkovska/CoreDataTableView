//
//  CoreTasksViewController.swift
//  TaskCoreDataTableView
//
//  Created by Mac on 11/28/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit
import CoreData

class CoreTasksModelView {
    
    public var tasks:[Task] = []
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
    }
    
    func fetchTasks( completion:(_ complete:Bool)->() ){
        guard  let manegedContext = container?.viewContext else {
            return
        }
        let fetchRequest = NSFetchRequest<Task>(entityName: "Task")
        do{
            self.tasks = try manegedContext.fetch(fetchRequest)
            print("Successflly fetch data")
            completion(true)
        }catch {
            debugPrint("Could not catch \(error.localizedDescription)")
            completion(false)
        }
    }
    
    func removeTask(atIndexPath indexPath: IndexPath) {
        guard let manegedContext = container?.viewContext else {
            return
        }
        
        manegedContext.delete(tasks[indexPath.row])
        
        do{
            try manegedContext.save()
            print("Successflly remove data")
        }catch{
            debugPrint("Could not remove\(error.localizedDescription)")
        }
    }

}
