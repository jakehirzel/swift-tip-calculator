//
//  TipCalculator.swift
//  CheckPlease
//
//  Created by Jake Hirzel on 7/4/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import UIKit

class TipCalculator {
    
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
    init() {
        
        // Initialize to recommended values, except for mealTotalArray which is blank
        self.tipPercentOne = 0.15
        self.tipPercentTwo = 0.18
        self.tipPercentThree = 0.20
        self.mealTotalArray = []
        self.lowMealTotal = 1.00
        self.highMealTotal = 500.00

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
    
    // Define function to extend array containing meal totals by $50
    func extendMealTotalArray(_ mealTotalArray: [Float]) -> [Float] {
        var i: Float = mealTotalArray.last!
        var localArray = mealTotalArray
        while i <= mealTotalArray.last! + 50.00 {
            localArray.append(i)
            i += 0.50
        }
        return localArray
    }
    
    // Define the basic function to calculate tip amounts from an index to the meal pricing array
    func tipCalculator(_ mealValue: Float, people: Float = 1.0) -> (tipOne: Float, tipTwo: Float, tipThree: Float, totalOne: Float, totalTwo: Float, totalThree: Float, splitTipOne: Float, splitTipTwo: Float, splitTipThree: Float, splitTotalOne: Float, splitTotalTwo: Float, splitTotalThree: Float) {
        
        // Compute tips
        let tipOne = mealValue * tipPercentOne
        let tipTwo = mealValue * tipPercentTwo
        let tipThree = mealValue * tipPercentThree
        
        let totalOne = tipOne + mealValue
        let totalTwo = tipTwo + mealValue
        let totalThree = tipThree + mealValue
        
        let splitTipOne = tipOne / people
        let splitTipTwo = tipTwo / people
        let splitTipThree = tipThree / people
        
        let splitTotalOne = totalOne / people
        let splitTotalTwo = totalTwo / people
        let splitTotalThree = totalThree / people
        
        return (tipOne, tipTwo, tipThree, totalOne, totalTwo ,totalThree, splitTipOne, splitTipTwo, splitTipThree, splitTotalOne, splitTotalTwo, splitTotalThree)
        
    }

}
