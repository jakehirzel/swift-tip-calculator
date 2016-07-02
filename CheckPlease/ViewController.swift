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
    @IBOutlet weak var keyboardToolbar: UIToolbar!
    
    
    let possibleTipPercentages = [0.15, 0.18, 0.20]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set total input as delegate
        totalBillField.delegate = self
        
        // Add done button to number pad
        addDoneButtonOnKeyboard()
        
    }
    
    func addDoneButtonOnKeyboard() {
        totalBillField.inputAccessoryView = keyboardToolbar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        let totalBillAmount = Double(textField.text!)!
        fifteenTipAmount.text = String(format: "%.2f", totalBillAmount * possibleTipPercentages[0])
        eighteenTipAmount.text = String(format: "%.2f", totalBillAmount * possibleTipPercentages[1])
        twentyTipAmount.text = String(format: "%.2f", totalBillAmount * possibleTipPercentages[2])
    }
    
    // MARK: Actions
    @IBAction func keyboardToolbarDone(sender: UIBarButtonItem) {
        self.totalBillField.resignFirstResponder()
    }
    
}

