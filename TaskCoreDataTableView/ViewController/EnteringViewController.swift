//
//  EnteringViewController.swift
//  TaskCoreDataTableView
//
//  Created by Mac on 11/30/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit

class EnteringViewController: UIViewController {
    
    private let coreEmloyeesViewModel = CoreEmloyeesViewModel()
    
    @IBOutlet weak var taskList: UILabel!
    @IBOutlet weak var empoyeeList: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupGestures()
    }
    
    func setupGestures(){
        let tapForTasks = UITapGestureRecognizer(target: self, action: #selector (tapFunctionforTasks(sender:)))
        let tapForEmployeeList = UITapGestureRecognizer(target: self, action: #selector (tapFunctionforEmployee(sender:)))
        taskList.addGestureRecognizer(tapForTasks)
        taskList.isUserInteractionEnabled = true
        empoyeeList.addGestureRecognizer(tapForEmployeeList)
        empoyeeList.isUserInteractionEnabled = true
    }
    
    @objc func tapFunctionforTasks(sender:UITapGestureRecognizer) {
        if let vc = UIStoryboard(name:CONSTANTS.main, bundle: nil).instantiateViewController(withIdentifier: VIEW_CONTROLLERS_IDENTIFIRES.tasksVC) as? TasksViewController
        {
            vc.coreEmployeesViewModel = self.coreEmloyeesViewModel
            present(vc, animated: true, completion: nil)
        }
    }
    
    @objc func tapFunctionforEmployee(sender:UITapGestureRecognizer) {
        if let vc = UIStoryboard(name: CONSTANTS.main, bundle: nil).instantiateViewController(withIdentifier: VIEW_CONTROLLERS_IDENTIFIRES.employeeVC) as? EmployeeViewController
        {   vc.coreEmloyeesViewModel = self.coreEmloyeesViewModel
            present(vc, animated: true, completion: nil)
        }
    }
    
}


