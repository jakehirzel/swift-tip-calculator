//
//  ModelData.swift
//  Check Please SwiftUI Watch App Watch App
//
//  Created by Jake Hirzel on 9/25/22.
//  Copyright © 2022 Jake Hirzel. All rights reserved.
//

import Foundation

final class ModelData: ObservableObject {
    @Published var mealTotalArray: [Float] = Array(stride(from: 1.00, to: 500.00, by: 0.50))
}

//
//    // Declare tip percentages
//    var tipPercentOne: Float = 0.15
//    var tipPercentTwo: Float = 0.18
//    var tipPercentThree: Float = 0.20
//
//    // Declare bounds for total meal pricing
//    var lowMealTotal: Float = 1.00
//    var highMealTotal: Float = 500.00
//
//    // Define function to create array containing meal totals based on meal price bounds
//    func createMealTotalArray() -> ([Float]) {
//        var i: Float = 0.00
//        var mealTotalArray: [Float] = []
//        while i <= highMealTotal {
//            mealTotalArray.append(i)
//            i += 0.5
//        }
//        return mealTotalArray
//    }
//
//    // Define function to extend array containing meal totals by $50
//    func extendMealTotalArray(_ mealTotalArray: [Float]) -> [Float] {
//        var i: Float = mealTotalArray.last!
//        var localArray = mealTotalArray
//        while i <= mealTotalArray.last! + 50.00 {
//            localArray.append(i)
//            i += 0.50
//        }
//        return localArray
//    }

