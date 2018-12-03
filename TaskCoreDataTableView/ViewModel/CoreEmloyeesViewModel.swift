//
//  CoreUsersViewModel.swift
//  TaskCoreDataTableView
//
//  Created by Mac on 11/30/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit
import CoreData

class CoreEmloyeesViewModel: CoreViewModelProtocol {

    public private(set) var employees:[Employee] = []
    private let container = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
    func appendEmployee(employee:Employee){
        employees.append(employee)
        guard let manegedContext = container?.viewContext else {
            return
        }
        saveManegedContext(manegedContext: manegedContext)
        
    }
    
    func fetchEmpoyees( completion:(_ complete:Bool)->() ){
        guard  let manegedContext = container?.viewContext else {
            return
        }
        let className = String(describing: Employee.self)
        let fetchRequest = NSFetchRequest<Employee>(entityName:className)
        do{
            self.employees = try manegedContext.fetch(fetchRequest)
            
            print("Successflly fetch data employee")
            completion(true)
        }catch {
            debugPrint("Could not catch \(error.localizedDescription)")
            completion(false)
        }
    }
    
    
    func removeEmployee(atIndexPath indexPath: IndexPath) {
        self.removeManegedObject(atIndexPath: indexPath, manegedContext: container?.viewContext, managedObjectsArray: self.employees)
    }
 
    
}
