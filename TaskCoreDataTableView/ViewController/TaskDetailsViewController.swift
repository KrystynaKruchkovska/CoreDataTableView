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
        
        
        let employee = self.coreEmloyeesViewModel.employees[indexPath.row]
        
        var checkboxOn = false
        
        if let taskEmployee = self.task.emloyee {
            checkboxOn = (taskEmployee == employee)
        }
        
        cell.configureCell(employee: employee, checkboxOn: checkboxOn)
        cell.checkbox.delegate = self
        
        return cell
    }
    
    func didTap(_ checkBox: BEMCheckBox) {
        let indexPath = self.getIndexPath(for:checkBox)

        if indexPath.indices.count < 1 {
            print("Fatal error")
            return
        }

        self.task.emloyee = self.coreEmloyeesViewModel.employees[indexPath.row]
        self.tableView.reloadData()
    }
    
    func getIndexPath(for checkbox:BEMCheckBox) -> IndexPath {
        for cell in self.tableView.visibleCells {
            if checkbox.isDescendant(of: cell) {
                guard let indexPath = self.tableView.indexPath(for: cell) else {
                    continue
                }
                
                return indexPath
            }
        }
        
        return IndexPath()
    }
    
    
    //    func didTabButton(checckbox:UIButton) {
    //        for cell in self.tableView.visibleCells {
    //            if cell.isDescendant(of: checckbox) {
    //                let indexPath = self.tableView.indexPath(for: cell)
    //            }
    //        }
    //    }
    
    
    
}

