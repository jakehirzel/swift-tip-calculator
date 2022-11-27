//
//  CkPls_Watch_AppApp.swift
//  CkPls Watch App Watch App
//
//  Created by Jake Hirzel on 11/26/22.
//  Copyright © 2022 Jake Hirzel. All rights reserved.
//

import SwiftUI

@main
struct CkPls_Watch_App_Watch_AppApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}

