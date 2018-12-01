//
//  AddEmloyeeInfo.swift
//  TaskCoreDataTableView
//
//  Created by Mac on 12/1/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit

class AddEmloyeeInfoVC: UIViewController {
    var coreUserViewModel:CoreEmloyeesViewModel!
    let container = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    var delegate:AddEmloyeeInfoVCDelegate?
    
    var defaulPhoto = UIImage(named: "default-user")
    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var firstNameTxtFld: UITextField!
    @IBOutlet weak var surenameTxtFld: UITextField!
    @IBOutlet weak var positionTxtFld: UITextField!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func doneBntWasPressed(_ sender: UIButton) {
        let employee = self.getUserFromTextFields()
        
        if let employee = employee {
            appendEmployee(employee: employee)
            if let delegate = self.delegate {
                delegate.employeeAdded()
            }
            self.dismiss(animated: true, completion: nil)
        } else {
            // show alert to user thtat something went wrong
            //self.errorLabel.text = "This field can not be empty"
        }
     
        
    }
    
    @IBAction func backButtonWasPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    func getUserFromTextFields() -> Employee? {
        guard let firstName = self.firstNameTxtFld.text else {
            return nil
        }
        guard let surename = self.surenameTxtFld.text else {
            return nil
        }
        guard let position = self.positionTxtFld.text else {
            return nil
        }

        let manegedContext = container?.viewContext
        let employeeObject = Employee(context: manegedContext!)
        
        employeeObject.name = firstName
        employeeObject.surname = surename
        employeeObject.position = position
        return employeeObject
        //create object User using managedContext (check how Task object is created)
    }
    
    func appendEmployee(employee:Employee){
        coreUserViewModel.employees.append(employee)
    }
    
    
}

protocol AddEmloyeeInfoVCDelegate {
    func employeeAdded()
}
