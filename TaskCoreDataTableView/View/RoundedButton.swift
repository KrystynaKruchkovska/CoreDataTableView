//
//  RaundedButton.swift
//  TaskCoreDataTableView
//
//  Created by Mac on 12/2/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {
    var cornerRadius : CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    override func awakeFromNib() {
        self.setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        self.setupView()
    }
    func setupView(){
        self.layer.cornerRadius = cornerRadius
    }
}
