//
//  CoreViewModel.swift
//  TaskCoreDataTableView
//
//  Created by Mac on 12/2/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import Foundation
import CoreData


protocol CoreViewModelProtocol {
    func saveManegedContext(manegedContext:NSManagedObjectContext)
    func removeManegedObject(atIndexPath indexPath: IndexPath, manegedContext:NSManagedObjectContext?,managedObjectsArray:[NSManagedObject] )
}

extension CoreViewModelProtocol{
    
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
