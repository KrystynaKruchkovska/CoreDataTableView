//
//  ExtensionTableView.swift
//  TaskCoreDataTableView
//
//  Created by Mac on 12/9/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func getIndexPath(for action:UIControl) -> IndexPath {
        for cell in self.visibleCells {
            if action.isDescendant(of: cell) {
                guard let indexPath = self.indexPath(for: cell) else {
                    continue
                }
                
                return indexPath
                
            }
        }
        
        return IndexPath()
    }
    
}
