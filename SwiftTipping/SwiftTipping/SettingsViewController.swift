//
//  SettingsViewController.swift
//  SwiftTipping
//
//  Created by Will Johansson on 2015-04-14.
//  Copyright (c) 2015 Will Johansson. All rights reserved.
//

import UIKit

class SettingsViewController : UIViewController {
    let defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var percentage: UITextField!
    override func viewDidLoad() {
        println("view did load")
    }
    
    override func didReceiveMemoryWarning() {
        println("did receive memory warning")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("view will appear")
        percentage.text = String(format: "%.0f", defaults.floatForKey("default_percentage"))
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("view did disappear")
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    @IBAction func onSave(sender: AnyObject) {
        let text = (percentage.text as NSString)
        defaults.setFloat(text.floatValue, forKey: "default_percentage")
        defaults.synchronize()
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}
