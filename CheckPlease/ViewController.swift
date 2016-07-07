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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
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
        
        // Only allow two characters after a .
        if totalBillLabel.text?.characters.count > 3 && totalBillLabel.text![(totalBillLabel.text?.endIndex.predecessor().predecessor().predecessor())!] == "." {
            return
        }
            
        // Otherwise add the characters to both strings
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