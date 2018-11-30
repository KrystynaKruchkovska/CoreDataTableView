//
//  EnteringViewController.swift
//  TaskCoreDataTableView
//
//  Created by Mac on 11/30/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit

class EnteringViewController: UIViewController {
    
    @IBOutlet weak var taskList: UILabel!
    @IBOutlet weak var empoyeeList: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: Selector(("tapFunction:")))
        taskList.addGestureRecognizer(tap)
    }
    
    func tapFunction(sender:UITapGestureRecognizer) {
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TasksViewController") as? TasksViewController
        {
            present(vc, animated: true, completion: nil)
        }
    }
    
}


