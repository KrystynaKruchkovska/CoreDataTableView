//
//  FlagPriority.swift
//  TaskCoreDataTableView
//
//  Created by Mac on 12/7/18.
//  Copyright © 2018 CO.KrystynaKruchcovska. All rights reserved.
//

import UIKit

class FlagPriority: UIView {
    
    var flagColor:UIColor?
    
    override func draw(_ rect: CGRect) {
        drawFlag(rect: rect)
    }
    
    func drawFlag (rect:CGRect){
        let bezierPath = UIBezierPath()
        let x = rect.size.width
        let y = rect.size.height
        bezierPath.move(to: CGPoint(x: 14.5/87 * x, y: 76.5/87 * y))
        bezierPath.addLine(to: CGPoint(x: 14.5/87.0 * x, y: 15.5/87.0 * y))
        bezierPath.addLine(to: CGPoint(x: 64.5/87.0 * x, y: 15.5/87.0 * y))
        bezierPath.addLine(to: CGPoint(x: 50.5/87.0 * x, y: 28.5/87.0 * y))
        bezierPath.addLine(to: CGPoint(x: 64.5/87.0 * x, y: 43.5/87.0 * y))
        bezierPath.addLine(to: CGPoint(x: 14.5/87.0 * x, y: 43.5/87.0 * y))
        
        if self.flagColor == nil {
            self.flagColor = .gray
        }
        
        self.flagColor!.setFill()
        
        bezierPath.fill()
        UIColor.black.setStroke()
        bezierPath.lineWidth = 1
        bezierPath.stroke()
    }
    
    
}
