//
//  Cell.swift
//  TaskCoreDataTableView
//
//  Created by Mac on 12/15/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit


extension UITableViewCell {
    static var defaultReuseIdentifier: String {
        // Should return the class's name, without namespacing or mangling.
        // This works as of Swift 3.1.1, but might be fragile.
        return "\(self)"
    }
}
