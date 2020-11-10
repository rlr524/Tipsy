//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Rob Ranf on 10/17/2020.
//  Copyright © 2020 Emiya Consulting. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var stepperButton: UIStepper!
    
    var tip: Double = 0.10
    
    @IBAction func tipChanged(_ sender: UIButton) {
        // Deselect all the tip buttons
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        // Make the button that triggered the action selected
        sender.isSelected = true
        
        // Get the current title of the button that was pressed
        let buttonTitle = sender.currentTitle ?? "None"
        
        // Remove the pct character from the title and turn it into a string
        let buttonTitleMinusPctSign = String(buttonTitle.dropLast())
        
        // Turn the new title string into a double
        let buttonTitleToDouble = Double(buttonTitleMinusPctSign) ?? 0.0
        
        // Turn the double into a decimal percent
        tip = buttonTitleToDouble / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(tip)
        print(splitNumberLabel.text ?? 2)
    }
}
