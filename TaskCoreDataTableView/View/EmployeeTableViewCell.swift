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
    
    
    func configureCell(user:User){
        
        self.personalInfo.text = "\(user.name) \(user.surname) \n \(user.position)"
        
        if let image = UIImage(named: "default-user") {
            self.profileImage.image = image
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
