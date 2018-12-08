//
//  ViewController.swift
//  TaskCoreDataTableView
//
//  Created by Mac on 11/25/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit
import CoreData

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let coreTasksViewModel = CoreTasksModelView()
    var coreEmployeesViewModel:CoreEmloyeesViewModel!


    
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var motivationLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.layer.cornerRadius = 20
    }
    
    @IBAction func backButtonWasPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        coreTasksViewModel.fetchTasks { (success ) in
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.coreTasksViewModel.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tasksTableViewCell") as? TasksTableViewCell else {
            fatalError("The dequeued cell is not an instance of TaskTableViewCell.")
        }
        let task = coreTasksViewModel.tasks[indexPath.row]
        let taskNumber = indexPath.row + 1

        cell.configureCell(task: task, taskNum: taskNumber)
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let selectedRow = indexPath.row
            let singleTaskViewController = segue.destination as! TaskDetailsViewController
            singleTaskViewController.task = self.coreTasksViewModel.tasks[selectedRow]
            singleTaskViewController.coreEmloyeesViewModel = self.coreEmployeesViewModel
            singleTaskViewController.coreTasksViewModel = self.coreTasksViewModel
        }
        print("prepare for segue")
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            self.coreTasksViewModel.removeTask(atIndexPath: indexPath)
            self.coreTasksViewModel.fetchTasks(completion: { (success) in
            })
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        
        deleteAction.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        return [deleteAction]
    }
}

