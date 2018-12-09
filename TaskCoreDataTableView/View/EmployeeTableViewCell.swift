//
//  EmployeeTableViewCell.swift
//  TaskCoreDataTableView
//
//  Created by Mac on 11/30/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var personalInfo: UILabel!
    @IBOutlet weak var totalTasks: UILabel!
    
    weak var delegate:PresentEmployeeTaskInfoProtocol?
    
    func configureCell(employee:Employee){
        
        guard let employeeName = employee.name  else {
            return
        }
        guard let employeeSurename = employee.surname  else {
            return
        }
        guard let employeePosition = employee.position  else {
            return
        }
        guard let employeeTotalTasks = employee.tasks?.count  else {
            return
        }
        self.personalInfo.text = "\(employeeName) \(employeeSurename) \n\(employeePosition)"
        
        if let image = UIImage(named: "default-user") {
            self.profileImage.image = image
        }
        self.totalTasks.text = String("Tasks:\(employeeTotalTasks)")
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func infoButtonWasPressed(_ sender: UIButton) {
        if let delegate = self.delegate {
            delegate.infoButtonDidSelect(sender)
        }
    }

}

protocol PresentEmployeeTaskInfoProtocol: class {
    func infoButtonDidSelect(_ infoBtn: UIButton)
}
