//
//  EmpoyeeViewController.swift
//  TaskCoreDataTableView
//
//  Created by Mac on 11/30/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit

class EmployeeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let coreEmloyeesViewModel = CoreEmloyeesViewModel()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    @IBAction func addBtnWasPressed(_ sender: Any) {
        
        let addEmployee = AddEmloyeeInfoVC()
        addEmployee.coreUserViewModel = self.coreEmloyeesViewModel
        addEmployee.modalPresentationStyle = .fullScreen
        present(addEmployee, animated: true, completion: nil)
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "employeeTableViewCell") as? EmployeeTableViewCell else {
            fatalError("The dequeued cell is not an instance of TaskTableViewCell.")
        }
        let employee = coreEmloyeesViewModel.employees[indexPath.row]
        
        cell.configureCell(employee: employee)
        
        
        return cell
    }
    
    
}
