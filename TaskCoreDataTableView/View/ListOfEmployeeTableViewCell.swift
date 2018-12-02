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
