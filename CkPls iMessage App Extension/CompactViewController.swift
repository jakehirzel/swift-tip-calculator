//
//  CompactViewController.swift
//  CkPls
//
//  Created by Jake Hirzel on 8/30/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import UIKit
import Messages

class CompactViewController: MSMessagesAppViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var compactCursor: UIView!
    @IBOutlet weak var totalBillLabel: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        compactCursor.blink()
        
        // Update values from TipData singleton
        if TipData.sharedInstance.totalBillLabel == "$0.00" {
            return
        }
        else {
            totalBillLabel.text = TipData.sharedInstance.totalBillLabel
        }
        
    }
    
    // MARK: Actions
    
    @IBAction func compactViewTapped(_ sender: AnyObject) {
        requestPresentationStyle(.expanded)
    }
    
}
