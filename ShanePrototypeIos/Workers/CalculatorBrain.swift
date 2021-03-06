//
//  CalculatorBrain.swift
//  ShanePrototypeIos
//
//  Created by Shane on 11/13/16.
//  Copyright © 2016 Shane. All rights reserved.
//

import Foundation

class CalculatorBrain{
    fileprivate var accumulator = 0.0
    fileprivate var memory = 0.0
    fileprivate var pending: PendingBinaryOperationInfo?
    
    func setOperant(_ operant: Double){
        accumulator = operant
    }
    
    func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .constant(let value):
                accumulator = value
            case .unaryOperation(let function):
                accumulator = function(accumulator)
            case .binaryOperation(let function):
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction:function, firstOperand: accumulator)
            case .equals:
                executePendingBinaryOperation()
            }
        }
    }
    
    var result: Double{
        get{
            return accumulator
        }
    }
    
    func clear(){
        accumulator = 0.0
    }
    
    fileprivate var operations: Dictionary<String, Operation> = [
        "π":Operation.constant(M_PI),
        "e":Operation.constant(M_E),
        "±":Operation.unaryOperation({-$0}),
        "√":Operation.unaryOperation(sqrt),
        "x^2" : Operation.unaryOperation({pow($0, 2.0)}),
        "cos" : Operation.unaryOperation(cos),
        "sin" : Operation.unaryOperation(sin),
        "tan" : Operation.unaryOperation(tan),
        "×" : Operation.binaryOperation({ $0 * $1 }),
        "÷" : Operation.binaryOperation({ $0 / $1 }),
        "+" : Operation.binaryOperation({ $0 + $1 }),
        "-" : Operation.binaryOperation({ $0 - $1 }),
        "=" : Operation.equals
    ]
    
    fileprivate enum Operation{
        case constant(Double)
        case unaryOperation((Double) -> Double)
        case binaryOperation((Double, Double) -> Double)
        case equals
    }
    
    fileprivate struct PendingBinaryOperationInfo {
        var binaryFunction : (Double, Double) -> Double
        var firstOperand: Double
    }
    
    fileprivate func executePendingBinaryOperation() {
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
}
