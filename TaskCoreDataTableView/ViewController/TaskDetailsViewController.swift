//
//  ListOfEmployeeViewController.swift
//  TaskCoreDataTableView
//
//  Created by Mac on 12/2/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit
import CoreData


class TaskDetailsViewController: UIViewController,UITableViewDelegate,BEMCheckBoxDelegate {
    
    var task:Task!
    var coreEmloyeesViewModel:CoreEmloyeesViewModel!
    var coreTasksViewModel:CoreTasksModelView!
    var selectedIndex:IndexPath!
    var genericDataSource: GenericDataSource<Employee,TaskDetailsTableViewCell>!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.genericDataSource = GenericDataSource(tableView: tableView, coreViewModel: coreEmloyeesViewModel, configureCell: { (cell, managedObject, indexPath) in
            
            var checkboxOn = false
            
            if let taskEmployee = self.task.emloyee {
                checkboxOn = (taskEmployee == managedObject)
            }
            
            cell.configureCell(employee: managedObject, checkboxOn: checkboxOn)
            cell.checkbox.delegate = self
        })
        
        self.tableView.delegate = self
        self.tableView.dataSource = self.genericDataSource
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

