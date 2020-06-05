//
//  ViewController.swift
//  Calculator
//
//  Created by Bhavik Kothari


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTypingNumber: Bool = true
    private var calculator = CalulatorLogic()
    private var displayValue: Double {
        get{
            guard let number = Double(displayLabel.text!) else{
                fatalError()
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        calculator.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
            
            if let results = calculator.calculate(symbol: calcMethod){
                displayValue = results
            }
            
            
        }
        
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle{
            if isFinishedTypingNumber{
                
                if numValue == "." && (displayLabel.text == "0" || displayLabel.text == "0.0"){
                    displayLabel.text = "0."
                    isFinishedTypingNumber = false
                }else{
                    displayLabel.text = numValue
                    isFinishedTypingNumber = false
                }
            }
            else{
                if numValue == "."{
                    let isInt = floor(displayValue) == displayValue
                    
                    if !isInt{
                        return
                    }
                }
                displayLabel.text?.append(numValue)
            }
        }
        
        
    }
    
}

