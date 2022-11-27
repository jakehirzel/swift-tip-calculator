//
//  ContentView.swift
//  CkPls Watch App Watch App
//
//  Created by Jake Hirzel on 11/26/22.
//  Copyright © 2022 Jake Hirzel. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   
    @EnvironmentObject var modelData: ModelData
    @State var pickerSelection: String = "$1.00"

    var body: some View {
        VStack {
            Text("Total:")
                .fontWeight(.black)
            Picker("Total:", selection: $pickerSelection) {
                ForEach(modelData.mealTotalArray, id: \.self) { mealTotal in
                    Text(String(format: "$%.2f", mealTotal))
                }
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
            .environmentObject(ModelData())
    }
}
