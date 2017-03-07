//
//  PaintCodeRobotViewController.swift
//  ShanePrototypeIos
//
//  Created by Shane on 3/7/17.
//  Copyright © 2017 Shane. All rights reserved.
//

import UIKit

class PaintCodeRobotViewController: UIViewController{
    
    @IBOutlet weak var robotView: PaintCodeRobotView!

    
    @IBAction func angleAction(_ sender: UISlider) {
        print("%f", sender.value)
        robotView.angle = CGFloat(sender.value)
    }
    
    
}
