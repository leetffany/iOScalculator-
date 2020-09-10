//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Jamie Kim  on 8/25/20.
//  Copyright © 2020 Jamie Kim . All rights reserved.
//

import Foundation

struct CalculatorLogic{
    //global should always to be private
    private var value: Double?
    
    //creating a tuple to save data for later use
    private var intermediateCalculation: (n1: Double, calMethod: String)?
    
    //allows other classes to set a value of this property
    mutating func setValue(_ value: Double){
        self.value = value
    }
    mutating func calculate(symbol: String) -> Double? {

        if let n = value {
            switch symbol{
            case "+/-":
                //number -> string
                //displayLabel.text = String(displayValue * -1)
                //displayValue = displayValue * -1
                //displayValue *= -1
                return n * -1
            case"AC":
                //displayLabel.text = "0"
                //displayValue = "0"
                return 0
            case "%":
                return n * (1/100)
            case "=":
                return performTwoNumCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, calMethod: symbol)
            }
        }
            return nil
    }
    //to avoid other classes accidentally call it
    private func performTwoNumCalculation(n2: Double) -> Double? {
        //tuples is optional -> unwrap
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calMethod{
            
            switch  operation{
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "%":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of cases.")
            }
        }
        return nil //when a user just pressed = button 
    }
}
