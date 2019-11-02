//
//  ExpandedViewController.swift
//  CkPls
//
//  Created by Jake Hirzel on 8/30/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import UIKit
import Messages

class ExpandedViewController: MSMessagesAppViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var totalBillLabel: UILabel!
    @IBOutlet weak var percentOne: UILabel!
    @IBOutlet weak var percentTwo: UILabel!
    @IBOutlet weak var percentThree: UILabel!
    
    @IBOutlet weak var tipsView: UIView!
    @IBOutlet weak var splitsView: UIView!
    @IBOutlet var tipLines: [UIStackView]!
    
    @IBOutlet weak var splitPercent: UILabel!
    @IBOutlet weak var splitTotal: UILabel!
    @IBOutlet weak var splitStepper: UIStepper!
    @IBOutlet weak var splitNumber: UILabel!
    @IBOutlet weak var splitPeople: UILabel!
    @IBOutlet weak var eachTotal: UILabel!
    
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
    
    @IBOutlet weak var cursor: UIView!

    // String to hold value of totalBillLabel without the $
    var totalBillLabelValue = ""
    
    // Create instance of TipCalculator class
    let tipCalculatorInstance = TipCalculator()
    
    // Create KeypadBehavior instance
    let keypadAction = KeypadBehavior()
    
    // Set initial state of splitsView
    var isSplitsViewShowing = false
    
    // Variable to Track Tag of Tip Stack Item Tapped
    var tipsStackTag = 0
    
    // Declare delegate property
    weak var delegate: ExpandedViewControllerDelegate? = nil
    
    override func viewDidAppear(_ animated: Bool) {
        
        // Make the cursor blink
        cursor.blink()
        
        // Set up the stepper
        splitStepper.tintColor = UIColor.white
        splitStepper.minimumValue = 1
        splitStepper.maximumValue = 100
        splitStepper.value = 1
        
        // Update values from TipData singleton
        if TipData.sharedInstance.totalBillLabel == "$0.00" {
            return
        }
        else {
            totalBillLabel.text = TipData.sharedInstance.totalBillLabel
            totalBillLabelValue = TipData.sharedInstance.totalBillLabelValue
            splitStepper.value = TipData.sharedInstance.splitNumber
            processTipCalculation()
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        // Update TipData singleton when chevron is tapped or other qualifying event happens!
        TipData.sharedInstance.totalBillLabel = totalBillLabel.text!
        TipData.sharedInstance.totalBillLabelValue = totalBillLabelValue
        TipData.sharedInstance.splitNumber = splitStepper.value
        
    }
    
    func processTipCalculation() {
        let totalBillFloat: Float? = Float(totalBillLabelValue)
        if totalBillFloat != nil {
            
            let tipResults = tipCalculatorInstance.tipCalculator(totalBillFloat!, people: Float(splitStepper.value))
            
            // Convert resulting floats to $0.00 format
            percentOne.text = String(format: "$%.2f", tipResults.tipOne) + " / " + String(format: "$%.2f", tipResults.totalOne)
            percentTwo.text = String(format: "$%.2f", tipResults.tipTwo) + " / " + String(format: "$%.2f", tipResults.totalTwo)
            percentThree.text = String(format: "$%.2f", tipResults.tipThree) + " / " + String(format: "$%.2f", tipResults.totalThree)
            
            // Update split number
            splitNumber.text = String(Int(splitStepper.value))
            if splitStepper.value == 1 {
                splitPeople.text = "Person"
            }
            else {
                splitPeople.text = "People"
            }
            
            // Set split total and each person total
            switch tipsStackTag {
            case 1:
                splitPercent.text = String(Int(tipCalculatorInstance.tipPercentOne * 100)) + "%"
                splitTotal.text = percentOne.text
                eachTotal.text = String(format: "$%.2f", tipResults.splitTipOne) + " / " + String(format: "$%.2f", tipResults.splitTotalOne)
            case 2:
                splitPercent.text = String(Int(tipCalculatorInstance.tipPercentTwo * 100)) + "%"
                splitTotal.text = percentTwo.text
                eachTotal.text = String(format: "$%.2f", tipResults.splitTipTwo) + " / " + String(format: "$%.2f", tipResults.splitTotalTwo)
            case 3:
                splitPercent.text = String(Int(tipCalculatorInstance.tipPercentThree * 100)) + "%"
                splitTotal.text = percentThree.text
                eachTotal.text = String(format: "$%.2f", tipResults.splitTipThree) + " / " + String(format: "$%.2f", tipResults.splitTotalThree)
            default:
                splitPercent.text = "15%"
                splitTotal.text = "$0.00 / $0.00"
                eachTotal.text = "$0.00 / $0.00"
            }
            
        }
        else {
            
            percentOne.text = "$0.00 / $0.00"
            percentTwo.text = "$0.00 / $0.00"
            percentThree.text = "$0.00 / $0.00"
            splitTotal.text = "$0.00 / $0.00"
            eachTotal.text = "$0.00 / $0.00"
            
            // Update split number
            splitNumber.text = String(Int(splitStepper.value))
            if splitStepper.value == 1 {
                splitPeople.text = "Person"
            }
            else {
                splitPeople.text = "People"
            }
            
        }
    }
    
    // MARK: Actions
    
    @IBAction func numKeyTapped(_ sender: UIButton) {
        
        // Process key press
        let keypadOutput = keypadAction.keypadButtonTapped(sender, textIn: totalBillLabel.text!, totalIn: totalBillLabelValue)
        
        // Assign return values to labels
        totalBillLabel.text = keypadOutput.textOut
        totalBillLabelValue = keypadOutput.totalOut
        
        // Process the tip
        processTipCalculation()
        
    }
    
    @IBAction func delKeyTapped(_ sender: UIButton) {
        if totalBillLabel.text == "$" {
        }
        else {
            totalBillLabel.text?.remove(at: (totalBillLabel.text?.index((totalBillLabel.text?.endIndex)!, offsetBy: -1))!)
            totalBillLabelValue.remove(at: totalBillLabelValue.index(totalBillLabelValue.endIndex, offsetBy: -1))
        }
        processTipCalculation()
    }
    
    @IBAction func tipTapped(_ sender: UITapGestureRecognizer) {
        
        tipsStackTag = (sender.view?.tag)!
        
        if isSplitsViewShowing == false {
            
            UIView.transition(
                from: tipsView,
                to: splitsView,
                duration: 1.0,
                options: [UIView.AnimationOptions.transitionFlipFromRight, UIView.AnimationOptions.showHideTransitionViews] ,
                completion: nil)
            
            processTipCalculation()
            
        }
            
        else {
            UIView.transition(
                from: splitsView,
                to: tipsView,
                duration: 1.0,
                options: [UIView.AnimationOptions.transitionFlipFromLeft, UIView.AnimationOptions.showHideTransitionViews],
                completion: nil)
        }
        
        isSplitsViewShowing = !isSplitsViewShowing
        
    }
    
    @IBAction func splitStepperTapped(_ sender: UIStepper) {
        processTipCalculation()
    }
    
    @IBAction func shareButtonTapped(_ sender: AnyObject) {
        
        // Update TipData singleton when share button is tapped
        TipData.sharedInstance.totalBillLabel = totalBillLabel.text!
        TipData.sharedInstance.totalBillLabelValue = totalBillLabelValue
        TipData.sharedInstance.splitNumber = splitStepper.value
        
        // Create the message strings
        let messageCaption = "With " + splitNumber.text! + " of us, your Tip / Total should be: " + eachTotal.text!
        let messageSubcaption = "(" + splitPercent.text! + " tip on a " + totalBillLabel.text! + " bill)."
        
        // Call delegate protocol method
        delegate?.createMessage(messageCaption, subcaption: messageSubcaption)
        
        // Then change presentation style
        requestPresentationStyle(.compact)
        
    }
}

// MARK: Delegate Protocol
protocol ExpandedViewControllerDelegate: class {
    func createMessage(_ caption: String, subcaption: String)
}
