//
//  EditTodoSheet.swift
//  Sublime To Do
//
//  Sheet for editing a todo item
//

import SwiftUI

struct EditTodoSheet: View {
    @EnvironmentObject var todoService: TodoService
    @Environment(\.dismiss) var dismiss

    let todo: TodoItem
    let dayLogId: String

    @State private var title: String
    @State private var description: String

    init(todo: TodoItem, dayLogId: String) {
        self.todo = todo
        self.dayLogId = dayLogId
        _title = State(initialValue: todo.title)
        _description = State(initialValue: todo.description)
    }

    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Text("Edit Todo")
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

                    TextField("Todo title", text: $title)
                        .textFieldStyle(.roundedBorder)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Description (optional)")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.secondary)

                    TextEditor(text: $description)
                        .frame(height: 120)
                        .font(.system(size: 14))
                        .padding(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.secondary.opacity(0.3), lineWidth: 1)
                        )
                }

                Spacer()

                HStack(spacing: 12) {
                    // Delete button
                    Button(action: deleteTodo) {
                        Text("Delete")
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .padding(12)
                            .background(Color.red.opacity(0.1))
                            .foregroundColor(.red)
                            .cornerRadius(8)
                    }
                    .buttonStyle(.plain)

                    // Save button
                    Button(action: saveTodo) {
                        Text("Save")
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
            }
            .padding()
        }
        .frame(width: 450, height: 400)
    }

    private func saveTodo() {
        var updatedTodo = todo
        updatedTodo.title = title
        updatedTodo.description = description

        todoService.updateTodo(updatedTodo, in: dayLogId)
        dismiss()
    }

    private func deleteTodo() {
        todoService.deleteTodo(todo, from: dayLogId)
        dismiss()
    }
}

#Preview {
    let todo = TodoItem(
        title: "Sample Todo",
        description: "This is a sample description",
        userId: "test",
        dayLogId: "test"
    )

    return EditTodoSheet(todo: todo, dayLogId: "test")
        .environmentObject(TodoService.shared)
}
