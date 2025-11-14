//
//  DayLog.swift
//  Sublime To Do
//
//  Day log model for organizing todos by day
//

import Foundation

struct DayLog: Identifiable, Codable, Hashable {
    let id: String
    let date: Date
    let userId: String
    var title: String
    var todos: [TodoItem]

    init(
        id: String = UUID().uuidString,
        date: Date = Date(),
        userId: String,
        title: String = "",
        todos: [TodoItem] = []
    ) {
        self.id = id
        self.date = date
        self.userId = userId
        self.title = title.isEmpty ? Self.defaultTitle(for: date) : title
        self.todos = todos
    }

    static func defaultTitle(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }

    var completedCount: Int {
        todos.filter { $0.isCompleted }.count
    }

    var totalCount: Int {
        todos.count
    }
}
