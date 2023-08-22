//
//  coreML-starter.swift
//
//  
//

import SwiftUI

@main
struct coreML_starterApp: App {
    
    @StateObject private var predictionStatus = PredictionStatus()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(predictionStatus)
        }
    }
}
