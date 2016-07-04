//
//  TipCalculator.swift
//  CheckPlease
//
//  Created by Jake Hirzel on 7/4/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import UIKit

class TipCalculator: NSObject {
    
    // MARK: Properties
    
    // Declare tip percentages
    var tipPercentOne: Float
    var tipPercentTwo: Float
    var tipPercentThree: Float
    
    // Declare mealTotalArray
    var mealTotalArray: [Float]
    
    // Declare bounds for total meal pricing
    var lowMealTotal: Float
    var highMealTotal: Float
    
    // MARK: Initialization
    override init() {
        
        // Initialize to recommended values, except for mealTotalArray which is blank
        self.tipPercentOne = 0.15
        self.tipPercentTwo = 0.18
        self.tipPercentThree = 0.20
        self.mealTotalArray = []
        self.lowMealTotal = 1.00
        self.highMealTotal = 500.00

        super.init()
        
        // Fill meal total array with recommended values
        self.mealTotalArray = self.createMealTotalArray()

    }
    
    // Define function to create array containing meal totals based on meal price bounds
    func createMealTotalArray() -> ([Float]) {
        var i: Float = 0.00
        var mealTotalArray: [Float] = []
        while i <= highMealTotal {
            mealTotalArray.append(i)
            i += 0.5
        }
        return mealTotalArray
    }
    
    // Define the basic function to calculate tip amounts from an index to the meal pricing array
    func tipCalculator(totalArray: [Float], index: Int) -> (tipOne: Float, tipTwo: Float, tipThree: Float) {
        
        // Compute tips
        let tipOne = totalArray[index] * tipPercentOne
        let tipTwo = totalArray[index] * tipPercentTwo
        let tipThree = totalArray[index] * tipPercentThree
        
        return (tipOne, tipTwo, tipThree)
        
    }

}
