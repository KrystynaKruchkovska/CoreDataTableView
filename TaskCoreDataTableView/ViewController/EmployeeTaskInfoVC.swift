//
//  EmployeeTaskInfoVC.swift
//  TaskCoreDataTableView
//
//  Created by Mac on 12/8/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit

class EmployeeTaskInfoVC: UIViewController, UITableViewDelegate,UITableViewDataSource {

    var coreEmloyeesViewModel:CoreEmloyeesViewModel!
    var employeeTasksArray:[Task]!
    var employee:Employee!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib.init(nibName: NIB_Name.employeeInfoCell, bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: TABLE_VIEW_CELL_IDENTIFIRES.employeeTaskInfoCell)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.prepareEmployeesArray()
    }
    
    func prepareEmployeesArray() {
        guard let employyeTaskArrayOpt = self.employee.tasks?.allObjects else {
            self.employeeTasksArray = []
            return
        }
        
        guard let employyeTasksArray =  employyeTaskArrayOpt as? [Task] else {
            self.employeeTasksArray = []
            return
        }
        
        self.employeeTasksArray = employyeTasksArray
    }
    
    @IBAction func backButtonWasPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (employee.tasks?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TABLE_VIEW_CELL_IDENTIFIRES.employeeTaskInfoCell) as? EmployeeTaskInfoTableViewCell else {
            fatalError("The dequeued cell is not an instance of TaskTableViewCell.")
        }
        
        let task = self.employeeTasksArray[indexPath.row]
        let taskNumber = indexPath.row + 1
        cell.configureCellFor(task: task,taskNum: taskNumber)
        
        return cell
    }
}
