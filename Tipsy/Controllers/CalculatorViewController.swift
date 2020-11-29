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
    var bill: Double = 0.0
    var split: String = "0"
    var splitAmount: String = "0"
    
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
        
        // Turn the bill entry into a double and make the numeric
        // keypad disappear after clicking elsewhere in the app
        let billTextDouble = Double(billTextField.text ?? "0.0")
        bill = billTextDouble ?? 0.0
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        split = splitNumberLabel.text ?? "2"
        let tipAmount = bill * tip
        let totalAmount = tipAmount + bill
        let splitAmountPre = totalAmount / Double(split)!
        let splitAmountFinal = String(format: "%.2f", splitAmountPre)
        splitAmount = splitAmountFinal
        print(tip)
        print(bill)
        print(split)
        print("Tip amount: \(tipAmount)")
        print("Total amount: \(totalAmount)")
        print("Split amount: \(splitAmountFinal)")
        self.performSegue(withIdentifier: "calculateTotal", sender: self)
    }
    
    // TODO: On the results screen we still need to carry out
    // the tip to two decimal places and carry out the bill
    // amount to two decimal places
    // TODO: Return to this screen when recalculate is pressed on
    // the results view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "calculateTotal" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.splitValue = splitAmount
            destinationVC.detailString = "$\(bill) split between \(split), with \(tip)% tip."
        }
    }
}
