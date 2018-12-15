//
//  GenericDataSource.swift
//  TaskCoreDataTableView
//
//  Created by Mac on 12/15/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class GenericDataSource<EntityType: NSManagedObject, CellType: UITableViewCell>: NSObject, UITableViewDataSource{
    
    var tableView: UITableView
    var coreViewModel: CoreViewModelGeneric <EntityType>
    var configureCell:(CellType, EntityType, IndexPath ) -> Void
    
    init(tableView: UITableView,coreViewModel: CoreViewModelGeneric <EntityType>,configureCell: @escaping (CellType, EntityType, IndexPath) -> Void ) {
        self.tableView = tableView
        self.coreViewModel = coreViewModel
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.coreViewModel.coreObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reusableIdentifier = CellType.defaultReuseIdentifier
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier:reusableIdentifier) as? CellType else {
            fatalError("The dequeued cell is not an instance of TaskTableViewCell.")
        }
        
        let coreObject = self.coreViewModel.coreObjects[indexPath.row]
        
        
        self.configureCell(cell, coreObject, indexPath)
        return cell
    }
    
    
}
