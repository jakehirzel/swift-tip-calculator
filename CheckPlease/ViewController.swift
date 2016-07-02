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
        
        // Add done button to number pad
        addDoneButtonOnKeyboard()
        
    }
    
    func addDoneButtonOnKeyboard() {
        
        // Make the toolbar
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRectMake(0, 0, 320, 50))
        doneToolbar.barStyle = UIBarStyle.Default
        
        // Make the buttons
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: #selector(ViewController.doneButtonAction))
        
        // Put them together
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        // Assign to totalBillField
        totalBillField.inputAccessoryView = doneToolbar
        
    }
    
    func doneButtonAction()
    {
        totalBillField.resignFirstResponder()
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
        if isNumeric(textField.text!) {
            let totalBillAmount = Double(textField.text!)!
            fifteenTipAmount.text = String(format: "%.2f", totalBillAmount * possibleTipPercentages[0])
            eighteenTipAmount.text = String(format: "%.2f", totalBillAmount * possibleTipPercentages[1])
            twentyTipAmount.text = String(format: "%.2f", totalBillAmount * possibleTipPercentages[2])
        }
        else {
            textField.resignFirstResponder()
            textField.text = nil
        }
    }
    
    func isNumeric(a: String) -> Bool {
        return Double(a) != nil
    }
    
    // ACTIONS:
    
    // Close keyboard when you tap
    @IBAction func backgroundTap(sender: UITapGestureRecognizer) {
        totalBillField.resignFirstResponder()
    }
    
}

