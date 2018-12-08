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

    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "EmployeeTaskInfoTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "EmployeeTaskInfoTableViewCell")
        // Do any additional setup after loading the view.
    }


    @IBAction func backButtonWasPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
