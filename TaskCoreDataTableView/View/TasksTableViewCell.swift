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
    @IBOutlet weak var flagPriority: FlagPriority!
    
    func configureCell(task:Task, taskNum:Int){
        self.taskLabel.text = task.taskDescription
        self.taskNumberLbl.text = "\(taskNum)"
        configureFlagColor(task: task)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.isHighlighted = true
        } else {
            self.isHighlighted = false
        }
    }
    
    func configureFlagColor(task:Task){
        if(task.priorityLevel?.contains("HIGH"))!{
            flagPriority.flagColor = .red
        }else if ((task.priorityLevel?.contains("MIDDLE"))!){
            flagPriority.flagColor = .yellow
        }else if ((task.priorityLevel?.contains("LOW"))!){
            flagPriority.flagColor = .green
        }
    }

}
