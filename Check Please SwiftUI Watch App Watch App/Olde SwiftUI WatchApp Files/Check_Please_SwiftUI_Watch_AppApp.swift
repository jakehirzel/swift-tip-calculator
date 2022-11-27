//
//  Check_Please_SwiftUI_Watch_AppApp.swift
//  Check Please SwiftUI Watch App Watch App
//
//  Created by Jake Hirzel on 9/25/22.
//  Copyright © 2022 Jake Hirzel. All rights reserved.
//

import SwiftUI

@main
struct Check_Please_SwiftUI_Watch_App_Watch_AppApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
