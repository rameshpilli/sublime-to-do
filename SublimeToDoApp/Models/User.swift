//
//  User.swift
//  Sublime To Do
//
//  User data model
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    var email: String
    var displayName: String
    var createdAt: Date

    init(id: String, email: String, displayName: String, createdAt: Date = Date()) {
        self.id = id
        self.email = email
        self.displayName = displayName
        self.createdAt = createdAt
    }
}
