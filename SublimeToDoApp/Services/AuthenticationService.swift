//
//  AuthenticationService.swift
//  Sublime To Do
//
//  Authentication service for user login/signup
//

import Foundation
import Combine

class AuthenticationService: ObservableObject {
    static let shared = AuthenticationService()

    @Published var isAuthenticated: Bool = false
    @Published var currentUser: User?
    @Published var errorMessage: String?

    private let userDefaultsKey = "currentUser"

    private init() {
        // Load saved user if exists
        loadSavedUser()
    }

    func login(email: String, password: String) async -> Bool {
        // Simulate authentication (in production, use Firebase Auth)
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000) // 1 second delay

            // Create or fetch user
            let user = User(
                id: UUID().uuidString,
                email: email,
                displayName: email.components(separatedBy: "@").first ?? "User"
            )

            await MainActor.run {
                self.currentUser = user
                self.isAuthenticated = true
                self.errorMessage = nil
                saveUser(user)
            }

            return true
        } catch {
            await MainActor.run {
                self.errorMessage = "Login failed: \(error.localizedDescription)"
            }
            return false
        }
    }

    func signup(email: String, password: String, displayName: String) async -> Bool {
        // Simulate signup (in production, use Firebase Auth)
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000) // 1 second delay

            let user = User(
                id: UUID().uuidString,
                email: email,
                displayName: displayName
            )

            await MainActor.run {
                self.currentUser = user
                self.isAuthenticated = true
                self.errorMessage = nil
                saveUser(user)
            }

            return true
        } catch {
            await MainActor.run {
                self.errorMessage = "Signup failed: \(error.localizedDescription)"
            }
            return false
        }
    }

    func logout() {
        currentUser = nil
        isAuthenticated = false
        UserDefaults.standard.removeObject(forKey: userDefaultsKey)
    }

    private func saveUser(_ user: User) {
        if let encoded = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }

    private func loadSavedUser() {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
           let user = try? JSONDecoder().decode(User.self, from: data) {
            currentUser = user
            isAuthenticated = true
        }
    }
}
