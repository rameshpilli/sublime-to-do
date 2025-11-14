//
//  SublimeToDoApp.swift
//  Sublime To Do
//
//  Main application entry point
//

import SwiftUI
import FirebaseCore

@main
struct SublimeToDoApp: App {
    @StateObject private var authService = AuthenticationService.shared

    init() {
        // Configure Firebase
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            if authService.isAuthenticated {
                MainView()
                    .environmentObject(authService)
            } else {
                LoginView()
                    .environmentObject(authService)
            }
        }
        .windowStyle(.hiddenTitleBar)
        .windowResizability(.contentSize)
    }
}
