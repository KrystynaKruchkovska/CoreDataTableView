//
//  ViewController.swift
//  TaskCoreDataTableView
//
//  Created by Mac on 11/25/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit
import CoreData

class TasksViewController: UIViewController, UITableViewDelegate {
    
    let coreTasksViewModel = CoreTasksModelView()
    var coreEmployeesViewModel:CoreEmloyeesViewModel!
    var genericDataSource: GenericDataSource<Task,TasksTableViewCell>!

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var motivationLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.layer.cornerRadius = 20
        self.genericDataSource = GenericDataSource(tableView: tableView, coreViewModel: coreTasksViewModel, configureCell: { (cell, managedObject, indexPath) in
            let taskNumber = indexPath.row + 1
            cell.configureCell(task: managedObject, taskNum: taskNumber)
        })
        
        self.tableView.delegate = self
        self.tableView.dataSource = self.genericDataSource
    }
    
    @IBAction func backButtonWasPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        coreTasksViewModel.fetchCoreObjects { (success ) in
            tableView.reloadData()
        }
    }
    
    @IBAction func addButtonWasPressed(_ sender: UIButton) {
        
        if textField.text != "" && textField.text != "What is your plan for today?" {
           
            let alert = UIAlertController(title: "Do you know level of priority for this task?", message: "Hight priority must be done first!", preferredStyle: .alert)
            

            alert.addAction(UIAlertAction(title: "Definitely HIGH!", style: .default, handler:
            {
                (alert: UIAlertAction!) -> Void in

                self.addTask(priorityLevel: .high)
            }))
            
            alert.addAction(UIAlertAction(title: "Rather MEDIUM.", style: .default, handler:
            {
                (alert: UIAlertAction!) -> Void in
               self.addTask(priorityLevel: .middle)
            }))
            
            alert.addAction(UIAlertAction(title: "LOW!", style: .default, handler:
            {
                (alert: UIAlertAction!) -> Void in
                self.addTask(priorityLevel: .low)
           }))
            
            self.present(alert, animated: true, completion: nil)
       
        }
    }
    
    func addTask(priorityLevel:TaskPriority) {
        self.coreTasksViewModel.addTask(textFieldText: self.textField.text!, priorityLevel: priorityLevel)
        textField.text = ""
        textField.placeholder = "Something else?"
        self.tableView.reloadData()
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let selectedRow = indexPath.row
            let singleTaskViewController = segue.destination as! TaskDetailsViewController
            singleTaskViewController.task = self.coreTasksViewModel.coreObjects[selectedRow]
            singleTaskViewController.coreEmloyeesViewModel = self.coreEmployeesViewModel
            singleTaskViewController.coreTasksViewModel = self.coreTasksViewModel
        }
        print("prepare for segue")
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            self.coreTasksViewModel.removeCoreObject(atIndexPath: indexPath)
            self.coreTasksViewModel.fetchCoreObjects(completion: { (success) in
            })
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        
        deleteAction.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        return [deleteAction]
    }
}

