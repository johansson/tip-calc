//
//  ViewController.swift
//  SwiftTipping
//
//  Created by Will Johansson on 2015-04-13.
//  Copyright (c) 2015 Will Johansson. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var tipPercentage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTipPercentageChanged(sender: UISlider) {
        let p = sender.value
        tipPercentage.text = "\(p)%"
    }
    
    @IBAction func onBillAmountChanged(sender: UITextField) {
        println("Bill amount changed to \(sender.text as NSString)")
    }

}

