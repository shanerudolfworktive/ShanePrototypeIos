//
//  PaintCodeRobotView.swift
//  ShanePrototypeIos
//
//  Created by Shane on 3/7/17.
//  Copyright © 2017 Shane. All rights reserved.
//

import UIKit

@IBDesignable
class PaintCodeRobotView: UIView{
    
    @IBInspectable
    var angle: CGFloat = 0 { didSet { setNeedsDisplay() } }
    @IBInspectable
    var red: CGFloat = 0.0 { didSet { setNeedsDisplay() } }
    
    override func draw(_ rect: CGRect) {
        RobotStyleKit.drawRobot(robotColor: UIColor(red: red, green: 0.976, blue: 0.065, alpha: 1.000), angle: angle)
    }
}
