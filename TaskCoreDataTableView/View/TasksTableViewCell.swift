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
    @IBOutlet weak var prioritylevel: UILabel!
    
    func configureCell(task:Task, taskNum:Int){
        self.taskLabel.text = task.taskDescription
        self.taskNumberLbl.text = "\(taskNum)"
        self.prioritylevel.text = task.priorityLevel
        if (task.priorityLevel?.contains("LOW"))! {
            self.prioritylevel.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        }else if (task.priorityLevel?.contains("MIDDLE"))!{
            self.prioritylevel.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        }else if (task.priorityLevel?.contains("HIGH"))!{
            self.prioritylevel.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            prioritylevel.layer.masksToBounds = true
            prioritylevel.layer.cornerRadius = 15
        }
        
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
