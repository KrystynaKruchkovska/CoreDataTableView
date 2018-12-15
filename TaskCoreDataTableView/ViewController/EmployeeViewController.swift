//
//  EmpoyeeViewController.swift
//  TaskCoreDataTableView
//
//  Created by Mac on 11/30/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit

class EmployeeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, PresentEmployeeTaskInfoProtocol {
   
    
    
    var coreEmloyeesViewModel:CoreEmloyeesViewModel!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        coreEmloyeesViewModel.fetchCoreObjects { (success) in
            self.tableView.reloadData()
        }
    }
    
    @IBAction func addBtnWasPressed(_ sender: Any) {
        
        let addEmployee = AddEmloyeeInfoVC()
        addEmployee.coreEmloyeesViewModel = self.coreEmloyeesViewModel
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
        return coreEmloyeesViewModel.coreObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TABLE_VIEW_CELL_IDENTIFIRES.employeeCell) as? EmployeeTableViewCell else {
            fatalError("The dequeued cell is not an instance of TaskTableViewCell.")
        }
        let employee = coreEmloyeesViewModel.coreObjects[indexPath.row]
        cell.configureCell(employee: employee)
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            
            self.coreEmloyeesViewModel.removeCoreObject(atIndexPath: indexPath)
            self.coreEmloyeesViewModel.fetchCoreObjects(completion: { (success) in
            })
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        return [deleteAction]
    }
    
    func infoButtonDidSelect(_ infoBtn: UIButton) {
        let indexPath = tableView.getIndexPath(for: infoBtn)
        if indexPath.indices.count < 1 {
            print("Fatal error")
            return
        }
            let presentInfo = EmployeeTaskInfoVC()
            presentInfo.coreEmloyeesViewModel = self.coreEmloyeesViewModel
            presentInfo.employee = self.coreEmloyeesViewModel.coreObjects[indexPath.row]
            presentInfo.modalPresentationStyle = .fullScreen
            present(presentInfo, animated: true, completion: nil)
        }
 
}
