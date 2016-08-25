//
//  ViewController.swift
//  CheckPlease
//
//  Created by Jake Hirzel on 7/2/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    // Set initial state of splitsView
    var isSplitsViewShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Make the cursor repeatedly blink
        cursor.blink()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Keyboard Behaviors
    
    func keypadButtonTapped(button: UIButton) {
        
        // Only allow 9 characters to be entered
        if (totalBillLabel.text?.characters.count)! > 9 {
            return
        }
        
        // Only allow two characters after a .
        else if (totalBillLabel.text?.characters.count)! > 3 &&
            
            totalBillLabel.text?[(totalBillLabel.text?.index((totalBillLabel.text?.endIndex)!, offsetBy: -3))!] == "." {
            return
        }
        
        // Only allow one .
        else if button.titleLabel!.text == "." && totalBillLabel.text?.characters.contains(".") == true {
            return
        }
        
        // Otherwise add the characters to both strings
        else {
            totalBillLabel.text?.append(button.titleLabel!.text!)
            totalBillLabelValue += button.titleLabel!.text!
        }
        processTipCalculation()
    }
    
    func processTipCalculation() {
        let totalBillFloat: Float? = Float(totalBillLabelValue)
        if totalBillFloat != nil {

            let tipResults = tipCalculatorInstance.tipCalculator(totalBillFloat!)
            
            // Convert resulting floats to $0.00 format
            percentOne.text = String(format: "$%.2f", tipResults.tipOne) + " / " + String(format: "$%.2f", tipResults.totalOne)
            percentTwo.text = String(format: "$%.2f", tipResults.tipTwo) + " / " + String(format: "$%.2f", tipResults.totalTwo)
            percentThree.text = String(format: "$%.2f", tipResults.tipThree) + " / " + String(format: "$%.2f", tipResults.totalThree)
            
        }
        else {
            percentOne.text = "$0.00 / $0.00"
            percentTwo.text = "$0.00 / $0.00"
            percentThree.text = "$0.00 / $0.00"
        }
    }
    
    // MARK: Actions

    @IBAction func numKeyTapped(sender: UIButton) {
        keypadButtonTapped(button: sender)
    }
    
    @IBAction func delKeyTapped(sender: UIButton) {
        if totalBillLabel.text == "$" {
        }
        else {
            totalBillLabel.text?.remove(at: (totalBillLabel.text?.index((totalBillLabel.text?.endIndex)!, offsetBy: -1))!)
            totalBillLabelValue.remove(at: totalBillLabelValue.index(totalBillLabelValue.endIndex, offsetBy: -1))
        }
        processTipCalculation()
    }
    
    @IBAction func tipTapped(_ sender: UITapGestureRecognizer) {
        
        if isSplitsViewShowing == false {
            UIView.transition(
                from: tipsView,
                to: splitsView,
                duration: 1.0,
                options: [UIViewAnimationOptions.transitionFlipFromRight, UIViewAnimationOptions.showHideTransitionViews] ,
                completion: nil)
        }
            
        else {
            UIView.transition(
                from: splitsView,
                to: tipsView,
                duration: 1.0,
                options: [UIViewAnimationOptions.transitionFlipFromLeft, UIViewAnimationOptions.showHideTransitionViews],
                completion: nil)
        }
        
        isSplitsViewShowing = !isSplitsViewShowing

    }
    
}
