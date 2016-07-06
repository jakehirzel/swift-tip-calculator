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
    
    // String to hold value of totalBillLabel without the $
    var totalBillLabelValue = ""
    
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
        
        let currentMealValue = tipCalculatorInstance.mealTotalArray[row]
        
        // Run the calculator
        let tipResults = tipCalculatorInstance.tipCalculator(currentMealValue)
        
        // Convert resulting floats to $0.00 format
        percentOne.text = String(format: "$%.2f", tipResults.tipOne)
        percentTwo.text = String(format: "$%.2f", tipResults.tipTwo)
        percentThree.text = String(format: "$%.2f", tipResults.tipThree)
        
    }
    
//    // MARK: Total Bill Label Parsing & Tip Calculation
//    
//    // Delete the $ and check if it's a number by trying to cast as a Double
//    func isNumeric() -> Bool {
//        var totalBillSansDollar = totalBillLabel.text
//        totalBillSansDollar!.removeAtIndex(totalBillSansDollar!.startIndex)
//        return Float(totalBillSansDollar!) != nil
//    }
//    
//    func totalBillLabelChanged() {
//        if isNumeric() {
//            var totalBillSansDollar: String = totalBillLabel.text!
//            totalBillSansDollar.removeAtIndex(totalBillSansDollar.startIndex)
//            let totalBillFloat = Float(totalBillSansDollar)!
//            var totalBillAmount: [Float] = []
//            totalBillAmount.append(totalBillFloat)
//            
//            let tipResults = tipCalculatorInstance.tipCalculator(totalBillAmount, index: 0)
//
//            // Convert resulting floats to $0.00 format
//            percentOne.text = String(format: "$%.2f", totalBillFloat)
//            percentTwo.text = String(format: "$%.2f", tipResults.tipTwo)
//            percentThree.text = String(format: "$%.2f", tipResults.tipThree)
//
//        }
//    }
    
    // MARK: Keyboard Behaviors
    
    func keypadButtonTapped(button: UIButton) {
        
        if totalBillLabel.text == "$0.00" {
            totalBillLabel.text = "$"
            totalBillLabel.text?.appendContentsOf(button.titleLabel!.text!)
            totalBillLabelValue += button.titleLabel!.text!
        }
        else {
            totalBillLabel.text?.appendContentsOf(button.titleLabel!.text!)
            totalBillLabelValue += button.titleLabel!.text!
        }
        processTipCalculation()
    }
    
    func processTipCalculation() {

        let totalBillFloat: Float? = Float(totalBillLabelValue)
        
        if totalBillFloat != nil {
            let tipResults = tipCalculatorInstance.tipCalculator(totalBillFloat!)
            
            // Convert resulting floats to $0.00 format
            percentOne.text = String(format: "$%.2f", tipResults.tipOne)
            percentTwo.text = String(format: "$%.2f", tipResults.tipTwo)
            percentThree.text = String(format: "$%.2f", tipResults.tipThree)
            
        }
        
    }
    
    // MARK: Actions
    
    @IBAction func numKeyTapped(sender: UIButton) {
        keypadButtonTapped(sender)
    }
    
    @IBAction func delKeyTapped(sender: UIButton) {
        if totalBillLabel.text == "$" {
        }
        else {
            totalBillLabel.text?.removeAtIndex((totalBillLabel.text?.endIndex.predecessor())!)
            totalBillLabelValue.removeAtIndex(totalBillLabelValue.endIndex.predecessor())
        }
        processTipCalculation()
    }
}