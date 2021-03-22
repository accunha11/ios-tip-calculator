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
    @IBOutlet weak var partySizeLabel: UILabel!
    @IBOutlet weak var partySizeStepper: UIStepper!
    @IBOutlet weak var totalPerPerson: UILabel!
    
    var currentValue : Int = 0
    var tipPercentage : Double = 0.0
    var tip : Double = 0.0
    var total : Double = 0.0
    var partySize : Double = 1
    
    // Access UserDefaults
    let defaults = UserDefaults.standard
    
    func tipCalculator(){
        // Force UserDefaults to save.
        defaults.synchronize()
        //Get slider value
        currentValue = Int(sliderControl.value)
        sliderLabel.text = "\(currentValue)%"
        
        //Get bill amount from text field input
        let bill = defaults.double(forKey: "myDefaultBill")
        
        //Get total tip by multiplying tip * tipPercentage
        tipPercentage = Double(currentValue) / 100;
        tip = (bill * tipPercentage)
        total = bill + tip
        totalPerPerson.text = String(format: "$%.2f per person", total/partySize)
        
        //Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        //Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func billUpdate(_ sender: Any) {
        let defaultBill = Double(billAmountTextField.text!) ?? 0
        defaults.set(defaultBill, forKey: "myDefaultBill")
        // Force UserDefaults to save.
        defaults.synchronize()
        tipCalculator()
    }
    
    
    @IBAction func sliderUpdate(_ sender: Any) {
        tipCalculator()
    }
    
    
    @IBAction func stepperUpdate(_ sender: Any) {
        partySize = partySizeStepper.value
        let printSize = Int(partySize)
        partySizeLabel.text = "\(printSize)"
        tipCalculator()
    }
    
    override func viewWillAppear( _ animated: Bool) {
        billAmountTextField.becomeFirstResponder()
        billAmountTextField.keyboardType = .decimalPad
        
        //set current defaults
        let currentDefaultTip = defaults.double(forKey: "myDefaultTip")
        sliderLabel.text = "\(currentDefaultTip)%"
        sliderControl.setValue(Float(currentDefaultTip), animated: true)
        
        let currentDefaultBill = defaults.double(forKey: "myDefaultBill")
        billAmountTextField.text = "$\(currentDefaultBill)"
        tipCalculator()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.6462594271, green: 0.7827685475, blue: 0.8271448016, alpha: 1)
        viewWillAppear(true)
    }
    
}

