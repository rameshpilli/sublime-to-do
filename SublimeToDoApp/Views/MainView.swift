//
//  MainView.swift
//  Sublime To Do
//
//  Main view with sidebar - Claude-like layout
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var authService: AuthenticationService
    @StateObject private var todoService = TodoService.shared
    @State private var selectedDayLog: DayLog?
    @State private var searchText = ""

    var body: some View {
        NavigationSplitView {
            // Sidebar
            SidebarView(
                selectedDayLog: $selectedDayLog,
                searchText: $searchText
            )
            .environmentObject(todoService)
        } detail: {
            // Main content area
            if let dayLog = selectedDayLog {
                DayLogDetailView(dayLog: dayLog)
                    .environmentObject(todoService)
            } else {
                EmptyStateView()
            }
        }
        .navigationSplitViewStyle(.balanced)
        .onAppear {
            // Create today's log if it doesn't exist
            if let userId = authService.currentUser?.id {
                let todayLog = todoService.getOrCreateDayLog(userId: userId)
                if selectedDayLog == nil {
                    selectedDayLog = todayLog
                }
            }
        }
    }
}

struct SidebarView: View {
    @EnvironmentObject var authService: AuthenticationService
    @EnvironmentObject var todoService: TodoService
    @Binding var selectedDayLog: DayLog?
    @Binding var searchText: String
    @State private var showingNewDayLog = false

    var filteredDayLogs: [DayLog] {
        guard let userId = authService.currentUser?.id else { return [] }
        let userLogs = todoService.getUserDayLogs(userId: userId)

        if searchText.isEmpty {
            return userLogs
        }

        return userLogs.filter { dayLog in
            dayLog.title.localizedCaseInsensitiveContains(searchText) ||
            dayLog.todos.contains { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            // Header
            VStack(spacing: 12) {
                HStack {
                    Text("Sublime To Do")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.primary)

                    Spacer()

                    Menu {
                        Button(action: {
                            authService.logout()
                        }) {
                            Label("Logout", systemImage: "arrow.right.square")
                        }
                    } label: {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.blue)
                    }
                    .menuStyle(.borderlessButton)
                }

                // New day log button
                Button(action: { showingNewDayLog = true }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("New Day Log")
                        Spacer()
                    }
                    .padding(12)
                    .background(Color.blue.opacity(0.1))
                    .foregroundColor(.blue)
                    .cornerRadius(8)
                }
                .buttonStyle(.plain)

                // Search
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.secondary)
                    TextField("Search logs...", text: $searchText)
                        .textFieldStyle(.plain)
                }
                .padding(8)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(6)
            }
            .padding()
            .background(Color(NSColor.controlBackgroundColor))

            Divider()

            // Day logs list
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(filteredDayLogs) { dayLog in
                        DayLogRowView(
                            dayLog: dayLog,
                            isSelected: selectedDayLog?.id == dayLog.id
                        )
                        .contentShape(Rectangle())
                        .onTapGesture {
                            selectedDayLog = dayLog
                        }
                    }
                }
            }

            Divider()

            // User info footer
            if let user = authService.currentUser {
                HStack(spacing: 12) {
                    Image(systemName: "person.circle.fill")
                        .font(.system(size: 32))
                        .foregroundColor(.blue)

                    VStack(alignment: .leading, spacing: 2) {
                        Text(user.displayName)
                            .font(.system(size: 14, weight: .medium))
                        Text(user.email)
                            .font(.system(size: 12))
                            .foregroundColor(.secondary)
                    }

                    Spacer()
                }
                .padding()
                .background(Color(NSColor.controlBackgroundColor))
            }
        }
        .frame(minWidth: 280, idealWidth: 300, maxWidth: 350)
        .sheet(isPresented: $showingNewDayLog) {
            NewDayLogSheet(selectedDayLog: $selectedDayLog)
                .environmentObject(todoService)
                .environmentObject(authService)
        }
    }
}

struct DayLogRowView: View {
    let dayLog: DayLog
    let isSelected: Bool

    var dateText: String {
        let calendar = Calendar.current
        let now = Date()

        if calendar.isDateInToday(dayLog.date) {
            return "Today"
        } else if calendar.isDateInYesterday(dayLog.date) {
            return "Yesterday"
        } else {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM d, yyyy"
            return formatter.string(from: dayLog.date)
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(dayLog.title)
                        .font(.system(size: 14, weight: .medium))
                        .lineLimit(1)

                    Text(dateText)
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                }

                Spacer()

                if dayLog.totalCount > 0 {
                    VStack(alignment: .trailing, spacing: 2) {
                        Text("\(dayLog.completedCount)/\(dayLog.totalCount)")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.secondary)

                        ProgressView(value: Double(dayLog.completedCount), total: Double(dayLog.totalCount))
                            .frame(width: 40)
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(isSelected ? Color.blue.opacity(0.1) : Color.clear)
        .overlay(
            Rectangle()
                .frame(width: 3)
                .foregroundColor(isSelected ? .blue : .clear),
            alignment: .leading
        )
    }
}

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "calendar.badge.plus")
                .font(.system(size: 60))
                .foregroundColor(.secondary)

            Text("Select a day log")
                .font(.system(size: 24, weight: .medium))
                .foregroundColor(.primary)

            Text("Choose a day log from the sidebar or create a new one")
                .font(.system(size: 14))
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(NSColor.textBackgroundColor))
    }
}

#Preview {
    MainView()
        .environmentObject(AuthenticationService.shared)
}
