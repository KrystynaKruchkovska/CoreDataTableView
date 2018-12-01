//
//  AddEmloyeeInfo.swift
//  TaskCoreDataTableView
//
//  Created by Mac on 12/1/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit

class AddEmloyeeInfoVC: UIViewController {
    
    
    var defaulPhoto = UIImage(named: "default-user")
    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var firstNameTxtFld: UITextField!
    @IBOutlet weak var surenameTxtFld: UITextField!
    @IBOutlet weak var positionTxtFld: UITextField!
    
    var coreUserViewModel:CoreUsersViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func doneBntWasPressed(_ sender: UIButton) {
        let user = self.getUserFromTextFields()
        //
    }
    
    @IBAction func backButtonWasPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    func getUserFromTextFields()->User {
        let firstname = self.firstNameTxtFld.text!
        
        //create object User using managedContext (check how Task object is created)
    }
    
    func addNewEmloyee(firstName:String,surename:String,position:String,imageProfile:UIImage){
        //self.firstNameTxtFld.text = firstName
        self.surenameTxtFld.text = surename
        self.positionTxtFld.text = position
        if self.profileImgView.image != nil{
            self.profileImgView.image = imageProfile
        }else{
            self.defaulPhoto = imageProfile
        }
        
        
    }
    
}
