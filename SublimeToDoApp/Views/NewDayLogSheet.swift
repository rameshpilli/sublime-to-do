//
//  NewDayLogSheet.swift
//  Sublime To Do
//
//  Sheet for creating a new day log
//

import SwiftUI

struct NewDayLogSheet: View {
    @EnvironmentObject var todoService: TodoService
    @EnvironmentObject var authService: AuthenticationService
    @Environment(\.dismiss) var dismiss
    @Binding var selectedDayLog: DayLog?

    @State private var title = ""
    @State private var selectedDate = Date()

    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Text("New Day Log")
                    .font(.system(size: 20, weight: .bold))

                Spacer()

                Button(action: { dismiss() }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.secondary)
                }
                .buttonStyle(.plain)
            }
            .padding()
            .background(Color(NSColor.controlBackgroundColor))

            Divider()

            // Form
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Title")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.secondary)

                    TextField("e.g., Work Tasks, Personal Goals", text: $title)
                        .textFieldStyle(.roundedBorder)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Date")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.secondary)

                    DatePicker("", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(.graphical)
                }

                Spacer()

                // Create button
                Button(action: createDayLog) {
                    Text("Create Day Log")
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .padding(12)
                        .background(title.isEmpty ? Color.gray.opacity(0.3) : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .buttonStyle(.plain)
                .disabled(title.isEmpty)
            }
            .padding()
        }
        .frame(width: 450, height: 550)
    }

    private func createDayLog() {
        guard let userId = authService.currentUser?.id else { return }

        let newDayLog = todoService.createDayLog(
            for: selectedDate,
            userId: userId,
            title: title.isEmpty ? DayLog.defaultTitle(for: selectedDate) : title
        )

        selectedDayLog = newDayLog
        dismiss()
    }
}

#Preview {
    NewDayLogSheet(selectedDayLog: .constant(nil))
        .environmentObject(TodoService.shared)
        .environmentObject(AuthenticationService.shared)
}
