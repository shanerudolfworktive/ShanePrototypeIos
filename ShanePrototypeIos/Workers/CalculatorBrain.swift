//
//  CalculatorBrain.swift
//  ShanePrototypeIos
//
//  Created by Shane on 11/13/16.
//  Copyright © 2016 Shane. All rights reserved.
//

import Foundation

class CalculatorBrain{
    private var accumulator = 0.0
    private var memory = 0.0
    private var pending: PendingBinaryOperationInfo?
    
    func setOperant(operant: Double){
        accumulator = operant
    }
    
    func performOperation(symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .Constant(let value):
                accumulator = value
            case .UnaryOperation(let function):
                accumulator = function(accumulator)
            case .BinaryOperation(let function):
                executePendingBinaryOperation()
                pending = PendingBinaryOperationInfo(binaryFunction:function, firstOperand: accumulator)
            case .Equals:
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
    
    private var operations: Dictionary<String, Operation> = [
        "π":Operation.Constant(M_PI),
        "e":Operation.Constant(M_E),
        "±":Operation.UnaryOperation({-$0}),
        "√":Operation.UnaryOperation(sqrt),
        "x^2" : Operation.UnaryOperation({pow($0, 2.0)}),
        "cos" : Operation.UnaryOperation(cos),
        "sin" : Operation.UnaryOperation(sin),
        "tan" : Operation.UnaryOperation(tan),
        "×" : Operation.BinaryOperation({ $0 * $1 }),
        "÷" : Operation.BinaryOperation({ $0 / $1 }),
        "+" : Operation.BinaryOperation({ $0 + $1 }),
        "-" : Operation.BinaryOperation({ $0 - $1 }),
        "=" : Operation.Equals
    ]
    
    private enum Operation{
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
    }
    
    private struct PendingBinaryOperationInfo {
        var binaryFunction : (Double, Double) -> Double
        var firstOperand: Double
    }
    
    private func executePendingBinaryOperation() {
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
}