//
//  ViewController.swift
//  Calculator
//
//  Created by Jamie Kim  on 8/25/20.
//  Copyright © 2020 Jamie Kim . All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingOperand: Bool = true
    
    //computed property, getter, setter
    //save 1st operand as well as convert to a double using safefy check
   
    private var displayValue: Double{
        get{
            guard let number = Double(displayLabel.text!) else{
            fatalError("cannot convert a string to a double")
            }
            return number
        }
        set{
            //using new value
            displayLabel.text = String(newValue)
            
        }
    }
    //true immutablity using let - struct, we won't change it for ever
    private var calculator = CalculatorLogic()
    
    @IBAction func operatorPressed(_ sender: UIButton) {
        isFinishedTypingOperand = true
        
        calculator.setValue(displayValue)
        //let calculator = CalculatorLogic(value: displValue)
        //optional binding -> guard let bc it should never happen
        //if let - when nil is rarely happen or it is okay to be nil - let it ignore
        if let calMethod = sender.currentTitle{
  
            if let result = calculator.calculate(symbol: calMethod) {
                displayValue = result // now unwrapped double
            }
            
        }
    }

    
    @IBAction func operandPressed(_ sender: UIButton) {
        
        if let operand = sender.currentTitle{
                if isFinishedTypingOperand{
                    displayLabel.text = operand
                    isFinishedTypingOperand = false
                } else{
                    if operand == "."{
                        //convert to a double using guard let
  //                      guard let currentValue = Double(displayLabel.text!) else{
    //                        fatalError("cannot conver to a string to a double")
      //                  }
                        let isInt = floor(displayValue) == displayValue
                        //only allow to add decimal to integer
                        if !isInt{
                            return
                        }
                    }
                    //continue to append
                    displayLabel.text = displayLabel.text! + operand
            
            }

        }


    
    }

}
