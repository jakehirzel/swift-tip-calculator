//
//  ViewController.swift
//  CheckPlease
//
//  Created by Jake Hirzel on 7/2/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: Properties
    @IBOutlet weak var totalBillPicker: UIPickerView!
    @IBOutlet weak var totalBillLabel: UILabel!
    @IBOutlet weak var percentOne: UILabel!
    @IBOutlet weak var percentTwo: UILabel!
    @IBOutlet weak var percentThree: UILabel!
    
    @IBOutlet weak var keyOne: UIButton!
    @IBOutlet weak var keyTwo: UIButton!
    @IBOutlet weak var keyThree: UIButton!
    @IBOutlet weak var keyFour: UIButton!
    @IBOutlet weak var keyFive: UIButton!
    @IBOutlet weak var keySix: UIButton!
    @IBOutlet weak var keySeven: UIButton!
    @IBOutlet weak var keyEight: UIButton!
    @IBOutlet weak var keyNine: UIButton!
    @IBOutlet weak var keyZero: UIButton!
    @IBOutlet weak var keyPoint: UIButton!
    @IBOutlet weak var keyDelete: UIButton!
    
    // Create instance of TipCalculator class
    let tipCalculatorInstance = TipCalculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set picker data source and delegate
        totalBillPicker.dataSource = self
        totalBillPicker.delegate = self
        
        // Populate array of total amounts
        tipCalculatorInstance.mealTotalArray = tipCalculatorInstance.createMealTotalArray()
        
        // Give focus to the picker
        totalBillPicker.focused
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UIPickerViewDelegate
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tipCalculatorInstance.mealTotalArray.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(format: "$%.2f", tipCalculatorInstance.mealTotalArray[row])
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        // Run the calculator
        let tipResults = tipCalculatorInstance.tipCalculator(tipCalculatorInstance.mealTotalArray, index: row)
        
        // Convert resulting floats to $0.00 format
        percentOne.text = String(format: "$%.2f", tipResults.tipOne)
        percentTwo.text = String(format: "$%.2f", tipResults.tipTwo)
        percentThree.text = String(format: "$%.2f", tipResults.tipThree)
        
    }
        
    // MARK: Keyboard Behaviors
    
    func keypadButtonTapped(button: UIButton) {
        if totalBillLabel.text == "$0.00" {
            totalBillLabel.text = "$"
            totalBillLabel.text?.appendContentsOf(button.titleLabel!.text!)
        }
        else {
            totalBillLabel.text?.appendContentsOf(button.titleLabel!.text!)
        }
    }
    
    // MARK: Actions
    
    @IBAction func numKeyTapped(sender: UIButton) {
        keypadButtonTapped(sender)
    }
    
    @IBAction func delKeyTapped(sender: UIButton) {
        if totalBillLabel.text == "$" {
            return
        }
        else {
            totalBillLabel.text?.removeAtIndex((totalBillLabel.text?.endIndex.predecessor())!)
        }
    }
}