//
//  TipCalculator.swift
//  CheckPlease
//
//  Created by Jake Hirzel on 7/4/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import UIKit

class TipCalculator: NSObject {
    
    // Create tip percentages, initialized to recommended values
    var tipPercentOne: Float = 0.15
    var tipPercentTwo: Float = 0.18
    var tipPercentThree: Float = 0.20
    
    // Create bounds for total meal pricing, initalized to recommended values
    var lowMealTotal: Float = 1.00
    var highMealTotal: Float = 500.00
    
    // Define function to create array containing meal totals based on meal price bounds
    func createMealTotalArray(low: Float, high: Float) -> ([Float]) {
        var i: Float = 0.00
        var mealTotalArray: [Float] = []
        while i <= high {
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
