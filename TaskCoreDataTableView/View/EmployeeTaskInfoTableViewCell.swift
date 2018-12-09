//
//  EmployeeTaskInfoTableViewCell.swift
//  TaskCoreDataTableView
//
//  Created by Mac on 12/8/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit
import CoreData

class EmployeeTaskInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var taskNumber: UILabel!
    @IBOutlet weak var taskTextView: UITextView!
    
    func configureCellFor(task:Task,taskNum:Int){
        self.taskTextView.text = task.taskDescription
        self.taskNumber.text = "\(taskNum)"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
