//
//  LoginView.swift
//  Sublime To Do
//
//  Login and signup view
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authService: AuthenticationService
    @State private var email = ""
    @State private var password = ""
    @State private var displayName = ""
    @State private var isSignupMode = false
    @State private var isLoading = false

    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.1, green: 0.1, blue: 0.2),
                    Color(red: 0.2, green: 0.1, blue: 0.3)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 0) {
                Spacer()

                // Logo and title
                VStack(spacing: 20) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.white)

                    Text("Sublime To Do")
                        .font(.system(size: 42, weight: .bold, design: .rounded))
                        .foregroundColor(.white)

                    Text(isSignupMode ? "Create your account" : "Welcome back")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white.opacity(0.8))
                }
                .padding(.bottom, 60)

                // Login form
                VStack(spacing: 16) {
                    if isSignupMode {
                        CustomTextField(
                            placeholder: "Display Name",
                            text: $displayName,
                            icon: "person.fill"
                        )
                    }

                    CustomTextField(
                        placeholder: "Email",
                        text: $email,
                        icon: "envelope.fill"
                    )

                    CustomTextField(
                        placeholder: "Password",
                        text: $password,
                        icon: "lock.fill",
                        isSecure: true
                    )

                    if let error = authService.errorMessage {
                        Text(error)
                            .font(.system(size: 14))
                            .foregroundColor(.red)
                            .padding(.top, 8)
                    }

                    Button(action: handleAuth) {
                        HStack {
                            if isLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                    .scaleEffect(0.8)
                            } else {
                                Text(isSignupMode ? "Sign Up" : "Log In")
                                    .font(.system(size: 18, weight: .semibold))
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.white.opacity(0.3), lineWidth: 1)
                        )
                    }
                    .buttonStyle(.plain)
                    .padding(.top, 8)
                    .disabled(isLoading)

                    Button(action: { isSignupMode.toggle() }) {
                        Text(isSignupMode ? "Already have an account? Log in" : "Don't have an account? Sign up")
                            .font(.system(size: 14))
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .buttonStyle(.plain)
                    .padding(.top, 8)
                }
                .frame(width: 400)
                .padding(40)
                .background(Color.white.opacity(0.1))
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                )

                Spacer()
                Spacer()
            }
            .padding(40)
        }
    }

    private func handleAuth() {
        isLoading = true

        Task {
            let success: Bool
            if isSignupMode {
                success = await authService.signup(email: email, password: password, displayName: displayName)
            } else {
                success = await authService.login(email: email, password: password)
            }

            await MainActor.run {
                isLoading = false
                if success {
                    email = ""
                    password = ""
                    displayName = ""
                }
            }
        }
    }
}

struct CustomTextField: View {
    let placeholder: String
    @Binding var text: String
    let icon: String
    var isSecure: Bool = false

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.white.opacity(0.6))
                .frame(width: 20)

            if isSecure {
                SecureField(placeholder, text: $text)
                    .textFieldStyle(.plain)
                    .foregroundColor(.white)
            } else {
                TextField(placeholder, text: $text)
                    .textFieldStyle(.plain)
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(Color.white.opacity(0.1))
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.white.opacity(0.2), lineWidth: 1)
        )
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthenticationService.shared)
}
