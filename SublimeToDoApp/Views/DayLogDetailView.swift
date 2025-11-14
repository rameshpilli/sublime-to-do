//
//  DayLogDetailView.swift
//  Sublime To Do
//
//  Detail view for a day log showing all todos
//

import SwiftUI

struct DayLogDetailView: View {
    @EnvironmentObject var todoService: TodoService
    let dayLog: DayLog
    @State private var newTodoTitle = ""
    @State private var editingTodo: TodoItem?

    private var currentDayLog: DayLog? {
        todoService.dayLogs.first { $0.id == dayLog.id }
    }

    var body: some View {
        VStack(spacing: 0) {
            // Header
            VStack(spacing: 16) {
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(currentDayLog?.title ?? dayLog.title)
                            .font(.system(size: 28, weight: .bold))

                        HStack(spacing: 12) {
                            Label(dateString, systemImage: "calendar")
                                .font(.system(size: 14))
                                .foregroundColor(.secondary)

                            if let todos = currentDayLog?.totalCount, todos > 0 {
                                Label("\(currentDayLog?.completedCount ?? 0) of \(todos) completed", systemImage: "checkmark.circle")
                                    .font(.system(size: 14))
                                    .foregroundColor(.secondary)
                            }
                        }
                    }

                    Spacer()
                }
                .padding(.horizontal, 24)
                .padding(.top, 24)

                // Add todo input
                HStack(spacing: 12) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.blue)

                    TextField("Add a new todo...", text: $newTodoTitle, onCommit: addTodo)
                        .textFieldStyle(.plain)
                        .font(.system(size: 15))
                }
                .padding(12)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .padding(.horizontal, 24)
                .padding(.bottom, 16)
            }
            .background(Color(NSColor.controlBackgroundColor))

            Divider()

            // Todos list
            if let todos = currentDayLog?.todos, !todos.isEmpty {
                ScrollView {
                    LazyVStack(spacing: 0) {
                        ForEach(todos) { todo in
                            TodoItemRowView(todo: todo, dayLogId: dayLog.id)
                                .environmentObject(todoService)
                                .onTapGesture {
                                    editingTodo = todo
                                }
                        }
                    }
                    .padding(.vertical, 8)
                }
            } else {
                // Empty state
                VStack(spacing: 16) {
                    Image(systemName: "checkmark.circle.badge.questionmark")
                        .font(.system(size: 60))
                        .foregroundColor(.secondary.opacity(0.5))

                    Text("No todos yet")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.secondary)

                    Text("Add your first todo to get started")
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(NSColor.textBackgroundColor))
        .sheet(item: $editingTodo) { todo in
            EditTodoSheet(todo: todo, dayLogId: dayLog.id)
                .environmentObject(todoService)
        }
    }

    private var dateString: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter.string(from: dayLog.date)
    }

    private func addTodo() {
        guard !newTodoTitle.trimmingCharacters(in: .whitespaces).isEmpty,
              let userId = AuthenticationService.shared.currentUser?.id else {
            return
        }

        todoService.addTodo(title: newTodoTitle, to: dayLog.id, userId: userId)
        newTodoTitle = ""
    }
}

struct TodoItemRowView: View {
    @EnvironmentObject var todoService: TodoService
    let todo: TodoItem
    let dayLogId: String
    @State private var isHovered = false

    var body: some View {
        HStack(spacing: 12) {
            // Checkbox
            Button(action: {
                todoService.toggleTodoCompletion(todo, in: dayLogId)
            }) {
                Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                    .font(.system(size: 20))
                    .foregroundColor(todo.isCompleted ? .green : .secondary)
            }
            .buttonStyle(.plain)

            // Content
            VStack(alignment: .leading, spacing: 4) {
                Text(todo.title)
                    .font(.system(size: 15))
                    .foregroundColor(todo.isCompleted ? .secondary : .primary)
                    .strikethrough(todo.isCompleted)

                if !todo.description.isEmpty {
                    Text(todo.description)
                        .font(.system(size: 13))
                        .foregroundColor(.secondary)
                        .lineLimit(2)
                }

                if todo.isCompleted, let completedAt = todo.completedAt {
                    Text("Completed \(timeAgoString(from: completedAt))")
                        .font(.system(size: 11))
                        .foregroundColor(.secondary.opacity(0.8))
                }
            }

            Spacer()

            // Delete button (shown on hover)
            if isHovered {
                Button(action: {
                    todoService.deleteTodo(todo, from: dayLogId)
                }) {
                    Image(systemName: "trash")
                        .font(.system(size: 14))
                        .foregroundColor(.red)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 12)
        .background(isHovered ? Color.gray.opacity(0.05) : Color.clear)
        .onHover { hovering in
            isHovered = hovering
        }
    }

    private func timeAgoString(from date: Date) -> String {
        let interval = Date().timeIntervalSince(date)
        let minutes = Int(interval / 60)
        let hours = minutes / 60
        let days = hours / 24

        if days > 0 {
            return "\(days) day\(days == 1 ? "" : "s") ago"
        } else if hours > 0 {
            return "\(hours) hour\(hours == 1 ? "" : "s") ago"
        } else if minutes > 0 {
            return "\(minutes) minute\(minutes == 1 ? "" : "s") ago"
        } else {
            return "just now"
        }
    }
}

#Preview {
    let dayLog = DayLog(
        date: Date(),
        userId: "test",
        title: "Today's Tasks",
        todos: [
            TodoItem(title: "Complete project proposal", description: "Finalize the Q4 proposal", userId: "test", dayLogId: "test"),
            TodoItem(title: "Review pull requests", isCompleted: true, userId: "test", dayLogId: "test"),
            TodoItem(title: "Team meeting at 3 PM", userId: "test", dayLogId: "test")
        ]
    )

    return DayLogDetailView(dayLog: dayLog)
        .environmentObject(TodoService.shared)
}
