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
    
    var billAmt: Float = 100.0
    var tipPct: Float = 20.0
    var tip: Float = 20.0
    var total: Float = 120.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmount.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTipPercentageChanged(sender: UISlider) {
        tipPct = sender.value
        tipPercentage.text = "\(tipPct)%"
        updateFields()
    }
    
    @IBAction func onBillAmountChanged(sender: UITextField) {
        billAmt = (sender.text as NSString).floatValue
        updateFields()
    }
    
    func updateFields() {
        println("billAmt: \(billAmt) * \(tipPct)")
        tip = billAmt * (tipPct / 100)
        total = billAmt + tip
        tipAmount.text = "$\(tip)"
        totalAmount.text = "$\(total)"
    }

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {

        return true;
    }

}

