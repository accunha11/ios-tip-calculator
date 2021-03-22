//
//  SettingsViewController.swift
//  Prework
//
//  Created by Ana Carolina Cunha on 3/21/21.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipTextField: UITextField!
    
    //Access UserDefaults
    let defaults = UserDefaults.standard
    
    @IBAction func updateDefaultTip(_ sender: Any) {
        //update default tip based on user input
        let defaultTip = Double(defaultTipTextField.text!) ?? 0
        defaults.set(defaultTip, forKey: "myDefaultTip")
        
        // Force UserDefaults to save.
        defaults.synchronize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let currentDefaultTip = defaults.double(forKey: "myDefaultTip")
        defaultTipTextField.text = "\(currentDefaultTip)%"
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.tintColor = UIColor.white
        defaultTipTextField.becomeFirstResponder()
        defaultTipTextField.keyboardType = .decimalPad
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
