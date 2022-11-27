//
//  ContentView.swift
//  Check Please SwiftUI Watch App Watch App
//
//  Created by Jake Hirzel on 9/25/22.
//  Copyright © 2022 Jake Hirzel. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // Declare mealTotalArray
    @State var mealTotalArray: [Float] = []
    @State var pickerSelection: String = "$1.00"
    
    // Declare bounds for total meal pricing
    var lowMealTotal: Float
    var highMealTotal: Float
    
    // Define function to create array containing meal totals based on meal price bounds
    func createMealTotalArray() -> ([Float]) {
        var i: Float = 0.00
        var mealTotalArray: [Float] = []
        while i <= highMealTotal {
            mealTotalArray.append(i)
            i += 0.5
        }
    }
    
    var body: some View {
        VStack {
            Text("Total:")
                .fontWeight(.black)
            Picker(selection: $pickerSelection, label: Text("Total:")) {
                mealTotalArray.forEach { pickerItem in
                    Text(pickerItem)
                }
            .frame(height: 37.0)
            .labelsHidden()
            Text("Tip:")
                .fontWeight(.black)
            Text("15% - $0.00")
            Text("18% - $0.00")
            Text("20% - $0.00")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
