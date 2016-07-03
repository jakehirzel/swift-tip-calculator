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
    
    var totalAmounts: [Float] = []
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        totalBillPicker.focus()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        // Populate totalAmounts array
        var i = 0
        while i < 499 {
            totalAmounts.append(Float(i))
            i += 1
        }
        
        let pickerItems: [WKPickerItem] = totalAmounts.map {
            let pickerItem = WKPickerItem()
            pickerItem.title = String(format: "$%.2f", $0)
            return pickerItem
        }
        
        totalBillPicker.setItems(pickerItems)
        
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // MARK: Actions
    
    @IBAction func pickerAction(value: Int) {
        
        // Figure out tips and convert floats to $0.00 format
        let formattedFifteen = String(format: "15%% - $%.2f", totalAmounts[value] * 0.15)
        let formattedEighteen = String(format: "18%% - $%.2f", totalAmounts[value] * 0.18)
        let formattedTwenty = String(format: "20%% - $%.2f", totalAmounts[value] * 0.20)

        // Set tips to labels
        fifteenPercent.setText("\(formattedFifteen)")
        eighteenPercent.setText("\(formattedEighteen)")
        twentyPercent.setText("\(formattedTwenty)")
        
        // Add whimsical haptic feedback
        WKInterfaceDevice.currentDevice().playHaptic(.DirectionDown)

    }
    
}
