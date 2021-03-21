//
//  ViewController.swift
//  Prework
//
//  Created by Ana Carolina Cunha on 3/20/21.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var sliderControl: UISlider!
    
    @IBAction func sliderCalc(_ sender: UISlider) {
        //Get slider value
        let currentValue = Int(sender.value)
        sliderLabel.text = "\(currentValue)%"
        
        //Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //Get total tip by multiplying tip * tipPercentage
        let tipPercentage = Double(currentValue) / 100;
        let tip = bill * tipPercentage
        let total = bill + tip
        
        //Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        //Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billAmountTextField.becomeFirstResponder()
        billAmountTextField.keyboardType = .decimalPad
    }

    
}

