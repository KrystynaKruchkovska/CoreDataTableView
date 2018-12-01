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
        self.personalInfo.text = "  \(employeeName) \(employeeSurename) \n \(employeePosition)"
        
        if let image = UIImage(named: "default-user") {
            self.profileImage.image = image
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
