//
//  CalculatorViewController.swift
//  ShanePrototypeIos
//
//  Created by Shane on 11/13/16.
//  Copyright © 2016 Shane. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController{
    
    @IBOutlet weak var display: UILabel!
    
    fileprivate var userIsInTheMiddleOfTyping = false
    fileprivate var decimalUsed = false
    fileprivate var brain = CalculatorBrain()
    
    @IBAction fileprivate func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTyping {
            
            if digit == "." && decimalUsed == true {
                return
            } else if digit == "." && decimalUsed == false {
                decimalUsed = true
            }
            
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        
        userIsInTheMiddleOfTyping = true
    }
    
    @IBAction fileprivate func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperant(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        
        displayValue = brain.result
    }
    
    @IBAction func clear(_ sender: AnyObject) {
        userIsInTheMiddleOfTyping = false
        decimalUsed = false
        brain.clear()
        displayValue = brain.result
        display.text = "0"
    }
    
    fileprivate var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        
        set {
            display.text = String(newValue)
        }
    }
}
