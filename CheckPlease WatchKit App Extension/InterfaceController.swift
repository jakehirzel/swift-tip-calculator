//
//  InterfaceController.swift
//  CheckPlease WatchKit App Extension
//
//  Created by Jake Hirzel on 7/3/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    // MARK: Properties
    @IBOutlet var totalBillPicker: WKInterfacePicker!
    @IBOutlet var fifteenPercent: WKInterfaceLabel!
    @IBOutlet var eighteenPercent: WKInterfaceLabel!
    @IBOutlet var twentyPercent: WKInterfaceLabel!
    
    // Create instance of TipCalculator class
    let tipCalculatorInstance = TipCalculator()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        totalBillPicker.focus()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()

        // Populate array of total amounts
        tipCalculatorInstance.mealTotalArray = tipCalculatorInstance.createMealTotalArray()

        // Map total amounts to the pickerItems array
        let pickerItems: [WKPickerItem] = tipCalculatorInstance.mealTotalArray.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = String(format: "$%.2f", $0)
            return pickerItem
        }
        
        // Apply values to the picker
        totalBillPicker.setItems(pickerItems)
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // MARK: Actions
    
    @IBAction func pickerAction(value: Int) {
        
        // Run the calculator
        let tipResults = tipCalculatorInstance.tipCalculator(tipCalculatorInstance.mealTotalArray, index: value)
        
        // Convert resulting floats to $0.00 format
        let formattedFifteen = String(format: "15%% - $%.2f", tipResults.tipOne)
        let formattedEighteen = String(format: "18%% - $%.2f", tipResults.tipTwo)
        let formattedTwenty = String(format: "20%% - $%.2f", tipResults.tipThree)

        // Set tips to labels
        fifteenPercent.setText("\(formattedFifteen)")
        eighteenPercent.setText("\(formattedEighteen)")
        twentyPercent.setText("\(formattedTwenty)")
        
        // Add whimsical haptic feedback
        WKInterfaceDevice.currentDevice().playHaptic(.DirectionDown)

    }
    
}
