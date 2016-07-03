//
//  ViewController.swift
//  CheckPlease
//
//  Created by Jake Hirzel on 7/2/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    @IBOutlet weak var totalBillField: UITextField!
    @IBOutlet weak var fifteenTipAmount: UILabel!
    @IBOutlet weak var eighteenTipAmount: UILabel!
    @IBOutlet weak var twentyTipAmount: UILabel!
    
    let possibleTipPercentages = [0.15, 0.18, 0.20]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set total input as delegate
        totalBillField.delegate = self
        
        // Open keyboard
        totalBillField.becomeFirstResponder()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        textField.text = (textField.text! as NSString).stringByReplacingCharactersInRange(range, withString: string)
        
        guard let totalBillAmount = Double(textField.text!) else {
            textField.text = nil
            return false
        }
                
        fifteenTipAmount.text = String(format: "%.2f", totalBillAmount * possibleTipPercentages[0])
        eighteenTipAmount.text = String(format: "%.2f", totalBillAmount * possibleTipPercentages[1])
        twentyTipAmount.text = String(format: "%.2f", totalBillAmount * possibleTipPercentages[2])
        
        return false
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return false
    }
    
}