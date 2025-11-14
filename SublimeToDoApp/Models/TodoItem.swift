//
//  TodoItem.swift
//  Sublime To Do
//
//  Todo item data model
//

import Foundation

struct TodoItem: Identifiable, Codable, Hashable {
    let id: String
    var title: String
    var description: String
    var isCompleted: Bool
    var createdAt: Date
    var completedAt: Date?
    var userId: String
    var dayLogId: String

    init(
        id: String = UUID().uuidString,
        title: String,
        description: String = "",
        isCompleted: Bool = false,
        createdAt: Date = Date(),
        completedAt: Date? = nil,
        userId: String,
        dayLogId: String
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.isCompleted = isCompleted
        self.createdAt = createdAt
        self.completedAt = completedAt
        self.userId = userId
        self.dayLogId = dayLogId
    }
}
