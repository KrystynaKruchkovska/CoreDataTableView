//
//  ListOfEmployeeViewController.swift
//  TaskCoreDataTableView
//
//  Created by Mac on 12/2/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit
import CoreData


class TaskDetailsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource,BEMCheckBoxDelegate {

    var task:Task!
    var coreEmloyeesViewModel:CoreEmloyeesViewModel!
    var selectedIndex:IndexPath!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        coreEmloyeesViewModel.fetchEmpoyees { (success) in
            self.tableView.reloadData()
        }
    }
    
    @IBAction func backButtonWasPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreEmloyeesViewModel.employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "listOfEmployeeTableViewCell") as? TaskDetailsTableViewCell else {
            return UITableViewCell()
        }
        let checkMark = BEMCheckBox()
        checkMark.on = false
       
        let employee = self.coreEmloyeesViewModel.employees[indexPath.row]
      
        cell.configureCell(employee: employee,checkbox:checkMark)
        
        return cell
   
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = IndexPath(row: indexPath.row, section: 0)
        let currentCell = tableView.cellForRow(at: index) as! TaskDetailsTableViewCell
     
    
    
    }
    
 
    
}

