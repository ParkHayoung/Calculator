//
//  ViewController.swift
//  Calculator
//
//  Created by HaYoung on 2016. 10. 18..
//  Copyright © 2016년 HaYoung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddelfOfTyping = false
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddelfOfTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        userIsInTheMiddelfOfTyping = true
    }
    
    private var displayValue: Double {
        get {   //displayValue의 값을 가져오기 위한 코드
            return Double(display.text!)!
        }
        set(value) {
            display.text = String(value)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsInTheMiddelfOfTyping {
            brain.setOperand(operand: displayValue)     //get,set인지 어떻게 알아요?
            userIsInTheMiddelfOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathematicalSymbol)
        }
        displayValue = brain.result
        
    }
}

