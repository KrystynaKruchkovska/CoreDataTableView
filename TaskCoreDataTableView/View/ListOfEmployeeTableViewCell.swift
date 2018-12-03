//
//  ListOfEmployeeTableViewCell.swift
//  TaskCoreDataTableView
//
//  Created by Mac on 12/2/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit

class ListOfEmployeeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    
    @IBOutlet weak var employeeInfo: UILabel!
    
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

        if let image = UIImage(named: "default-user") {
            self.profileImg.image = image
        }
        self.employeeInfo.text = "\(employeeName) \(employeeSurename) \n\(employeePosition)"
    }
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func checkMarkButtonWasPressed(_ sender: UIButton) {
    }
    

}
