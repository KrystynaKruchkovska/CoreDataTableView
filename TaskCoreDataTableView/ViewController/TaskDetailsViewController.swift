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
    var coreTasksViewModel:CoreTasksModelView!
    var selectedIndex:IndexPath!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        coreEmloyeesViewModel.fetchCoreObjects { (success) in
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
        return coreEmloyeesViewModel.coreObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier:TABLE_VIEW_CELL_IDENTIFIRES.listOfEmployeeCell) as? TaskDetailsTableViewCell else {
            fatalError("The dequeued cell is not an instance of TaskTableViewCell.")
        }
        
        
        let employee = self.coreEmloyeesViewModel.coreObjects[indexPath.row]
        
        var checkboxOn = false
        
        if let taskEmployee = self.task.emloyee {
            checkboxOn = (taskEmployee == employee)
        }
        
        cell.configureCell(employee: employee, checkboxOn: checkboxOn)
        cell.checkbox.delegate = self
        
        return cell
    }
    
    func didTap(_ checkBox: BEMCheckBox) {
        let indexPath = tableView.getIndexPath(for: checkBox)
        
        if indexPath.indices.count < 1 {
            print("Fatal error")
            return
        }

        if !checkBox.on {
            self.coreTasksViewModel.unset(task: self.task)
        } else {
            let tappedEmployee = self.coreEmloyeesViewModel.coreObjects[indexPath.row]
            self.coreTasksViewModel.set(employee: tappedEmployee, for: self.task)
        }
        
        
        print("tapped")
        self.tableView.reloadData()
    }
 

    

    
}

