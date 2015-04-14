//
//  ViewController.swift
//  SwiftTipping
//
//  Created by Will Johansson on 2015-04-13.
//  Copyright (c) 2015 Will Johansson. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var tipPercentage: UILabel!
    @IBOutlet weak var percentageSlider: UISlider!
    
    var billAmt: Float = 100.0
    var tipPct: Float = 20.0
    var tip: Float = 20.0
    var total: Float = 120.0
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmount.delegate = self
        tipPct = defaults.floatForKey("default_percentage")
        percentageSlider.value = tipPct
        updateFields()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTipPercentageChanged(sender: UISlider) {
        tipPct = round(sender.value)
        updateFields()
    }
    
    @IBAction func onBillAmountChanged(sender: UITextField) {
        let text = (sender.text as NSString)

        billAmt = (text.substringFromIndex(1) as NSString).floatValue
        updateFields()
    }
    
    func updateFields() {
        tip = billAmt * (tipPct / 100)
        total = billAmt + tip
        tipAmount.text = String(format: "$%.2f", tip)
        totalAmount.text = String(format: "$%.2f", total)
        tipPercentage.text = String(format: "%.0f%%", tipPct)
    }

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {

        let text = (textField.text as NSString)
        
        // don't delete the $
        if (text.length == 1 && string == "") { return false }
        
        // don't add another decimal
        if (text.containsString(".") && string == ".") { return false }

        // don't blow up
        if (string != "" && text.length >= 1 && text.length <= 2) { return true }
        
        // don't add more than 2 decimal places
        if (string != "" && text.substringFromIndex(text.length - 3).hasPrefix(".")) { return false }
        
        return true
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func onSwipe(sender: AnyObject) {
        // go to settings
        performSegueWithIdentifier("firstSegue", sender: self)
    }
}

