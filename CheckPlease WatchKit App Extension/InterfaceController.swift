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
    @IBOutlet var totalBill: WKInterfaceLabel!
    @IBOutlet var totalBillSlider: WKInterfaceSlider!
    @IBOutlet var fifteenPercent: WKInterfaceLabel!
    @IBOutlet var eighteenPercent: WKInterfaceLabel!
    @IBOutlet var twentyPercent: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    // MARK: Actions
    
    @IBAction func sliderAction(value: Float) {
        
        // Convert float to $0.00 format
        let formattedTotal = String(format: "$%.2f", value)
        
        // Set to totalBill
        totalBill.setText("\(formattedTotal)")
        
        // Figure out tips and convert floats to $0.00 format
        let formattedFifteen = String(format: "15%% - $%.2f", value * 0.15)
        let formattedEighteen = String(format: "18%% - $%.2f", value * 0.18)
        let formattedTwenty = String(format: "20%% - $%.2f", value * 0.20)
        
        // Set tips to labels
        fifteenPercent.setText("\(formattedFifteen)")
        eighteenPercent.setText("\(formattedEighteen)")
        twentyPercent.setText("\(formattedTwenty)")
        
    }
    
}
