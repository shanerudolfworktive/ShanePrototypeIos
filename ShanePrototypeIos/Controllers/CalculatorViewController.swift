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
    
    private var userIsInTheMiddleOfTyping = false
    private var decimalUsed = false
    private var brain = CalculatorBrain()
    
    @IBAction private func touchDigit(sender: UIButton) {
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
    
    @IBAction private func performOperation(sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperant(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        
        displayValue = brain.result
    }
    
    @IBAction func clear(sender: AnyObject) {
        userIsInTheMiddleOfTyping = false
        decimalUsed = false
        brain.clear()
        displayValue = brain.result
        display.text = "0"
    }
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        
        set {
            display.text = String(newValue)
        }
    }
}
