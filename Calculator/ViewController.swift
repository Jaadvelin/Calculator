//
//  ViewController.swift
//  Calculator
//
//  Created by Iván Alejandro Bustillos Sánchez on 2/21/20.
//  Copyright © 2020 owo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var displayLabel: UILabel!
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingMath = false
    var keepDisplayValue = false
    enum currentMath {
        case inicio
        case suma
        case resta
        case multi
        case divi
    }
    var status: currentMath? = .inicio
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: Actions
    @IBAction func processNumber(_ sender: UIButton) {
        if let numberText = sender.titleLabel?.text {
            if !keepDisplayValue {
                displayLabel.text = numberText
                keepDisplayValue = true
            } else {
                displayLabel.text = displayLabel.text! + numberText
            }
            if (displayLabel.text == ".")
            {
                displayLabel.text = "0."
            }
            numberOnScreen = Double(displayLabel.text!)!
        }
    }
    
    @IBAction func clearDisplay(_ sender: UIButton) {
        displayLabel.text = "0"
        keepDisplayValue = false
        numberOnScreen = 0
        previousNumber = 0
    }
    
    @IBAction func sum(_ sender: UIButton) {
        displayLabel.text = "+"
        keepDisplayValue = false
        if performingMath {
            equals()
        }
        else {
            previousNumber = numberOnScreen
        }
        status = .suma
        performingMath = true
    }
    
    @IBAction func rest(_ sender: UIButton) {
            displayLabel.text = "-"
            keepDisplayValue = false
            if performingMath {
                equals()
            }
            else {
                previousNumber = numberOnScreen
            }
            status = .resta
            performingMath = true
        }

    @IBAction func mult(_ sender: UIButton) {
            displayLabel.text = "X"
            keepDisplayValue = false
            if performingMath {
                equals()
            }
            else {
                previousNumber = numberOnScreen
            }
            status = .multi
            performingMath = true
        }

    @IBAction func divis(_ sender: UIButton) {
            displayLabel.text = "/"
            keepDisplayValue = false
            if performingMath {
                equals()
            }
            else {
                previousNumber = numberOnScreen
            }
            status = .divi
            performingMath = true
        }

    
    @IBAction func equalsButton(_ sender: UIButton) {
        if performingMath {
            equals()
            performingMath = false
            status = .inicio
            
        }
    }
    
    func equals(){
            switch status {
                case .suma:
                    previousNumber = previousNumber + numberOnScreen
                    displayLabel.text = "\(previousNumber)"
                case .resta:
                    previousNumber = previousNumber - numberOnScreen
                    displayLabel.text = "\(previousNumber)"
                case .multi:
                    previousNumber = previousNumber * numberOnScreen
                    displayLabel.text = "\(previousNumber)"
                case .divi:
                    previousNumber = previousNumber / numberOnScreen
                    displayLabel.text = "\(previousNumber)"
                default:
                    displayLabel.text = displayLabel.text
            }
    }
    
}

