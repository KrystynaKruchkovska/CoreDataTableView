//
//  TasksTableViewCell.swift
//  TaskCoreDataTableView
//
//  Created by Mac on 11/25/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit
import CoreData

class TasksTableViewCell: UITableViewCell {
 
    @IBOutlet weak var taskNumberLbl: UILabel!
    @IBOutlet weak var taskLabel: UILabel!
    
    func configureCell(task:Task, taskNum:Int){
        self.taskLabel.text = task.taskDescription
        self.taskNumberLbl.text! = "\(taskNum)"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.isHighlighted = true
        } else {
            self.isHighlighted = false
        }
        
        // Configure the view for the selected state
    }

}
