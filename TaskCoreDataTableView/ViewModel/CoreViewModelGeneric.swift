//
//  CoreViewModel.swift
//  TaskCoreDataTableView
//
//  Created by Mac on 12/2/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import Foundation
import CoreData


class CoreViewModelGeneric <EntityType:NSManagedObject> {

    let container = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    var coreObjects:[EntityType] = []
    
    func appendCoreObject(coreObject:EntityType){
        coreObjects.append(coreObject)
        
        guard let manegedContext = container?.viewContext else {
            return
        }
        saveManegedContext(manegedContext: manegedContext)
    }
    
    func fetchCoreObjects( completion:(_ complete:Bool)->() ){
        guard  let manegedContext = container?.viewContext else {
            return
        }
        let className = String(describing: EntityType.self)
        let fetchRequest = NSFetchRequest<EntityType>(entityName: className)
        do{
            self.coreObjects = try manegedContext.fetch(fetchRequest)
            print("Successflly fetch data")
            completion(true)
        } catch {
            debugPrint("Could not catch \(error.localizedDescription)")
            completion(false)
        }
    }
    
    
    func removeCoreObject(atIndexPath indexPath: IndexPath) {
        self.removeManegedObject(atIndexPath: indexPath, manegedContext: container?.viewContext, managedObjectsArray: self.coreObjects)
    }
    
    
    func saveManegedContext(manegedContext:NSManagedObjectContext){
        
        do{
            try manegedContext.save()
            print("Successflly remove data")
        }catch{
            debugPrint("Could not remove\(error.localizedDescription)")
        }
        
    }
    
    func removeManegedObject(atIndexPath indexPath: IndexPath, manegedContext:NSManagedObjectContext?, managedObjectsArray:[NSManagedObject] ) {
        if let manegedContext = manegedContext {
            manegedContext.delete(managedObjectsArray[indexPath.row])
             saveManegedContext(manegedContext: manegedContext)
        }
      
    }
    
}
