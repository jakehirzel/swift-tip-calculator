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
    @IBOutlet var percentOne: WKInterfaceLabel!
    @IBOutlet var percentTwo: WKInterfaceLabel!
    @IBOutlet var percentThree: WKInterfaceLabel!
    
    // Create instance of TipCalculator class
    let tipCalculatorInstance = TipCalculator()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.

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
        
        // Set picker to $20
        totalBillPicker.setSelectedItemIndex(40)
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        // Give the picker focus
        totalBillPicker.focus()

    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // MARK: Actions
    
    @IBAction func pickerAction(_ value: Int) {
        
        // Get displayed picker value
        let currentMealValue = tipCalculatorInstance.mealTotalArray[value]
        
        // Run the calculator
        let tipResults = tipCalculatorInstance.tipCalculator(currentMealValue)
        
        // Convert resulting floats to $0.00 format
        let formattedTipOne = String(format: "15%% - $%.2f", tipResults.tipOne)
        let formattedTipTwo = String(format: "18%% - $%.2f", tipResults.tipTwo)
        let formattedTipThree = String(format: "20%% - $%.2f", tipResults.tipThree)

        // Set tips to labels
        percentOne.setText("\(formattedTipOne)")
        percentTwo.setText("\(formattedTipTwo)")
        percentThree.setText("\(formattedTipThree)")
        
        // Add whimsical haptic feedback
        WKInterfaceDevice.current().play(.directionDown)

    }
    
}
