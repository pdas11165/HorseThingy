//
//  Horse_AppApp.swift
//  Horse App
//
//  Created by Monika Paudel on 2025-01-28.
//

import SwiftUI

@main
struct Horse_AppApp: App {
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(appState)
        }
    }
}
