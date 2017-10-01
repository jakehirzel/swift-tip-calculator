//
//  TipData.swift
//  CkPls
//
//  Created by Jake Hirzel on 8/30/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import Foundation

class TipData {

    var totalBillLabel: String
    var totalBillLabelValue: String
    var splitNumber: Double
    
    fileprivate init() {
        self.totalBillLabel = "$0.00"
        self.totalBillLabelValue = "0.00"
        self.splitNumber = 1
    }
    
    static let sharedInstance = TipData()

}
