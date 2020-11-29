//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Rob Ranf on 10/17/2020.
//  Copyright © 2020 Emiya Consulting. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var splitValue: String?
    var detailString: String?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = splitValue
        settingsLabel.text = detailString
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
    }
    
}
