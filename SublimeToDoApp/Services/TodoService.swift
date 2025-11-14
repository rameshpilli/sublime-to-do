//
//  TodoService.swift
//  Sublime To Do
//
//  Service for managing todos and day logs
//

import Foundation
import Combine

class TodoService: ObservableObject {
    static let shared = TodoService()

    @Published var dayLogs: [DayLog] = []

    private let dayLogsKey = "dayLogs"

    private init() {
        loadDayLogs()
    }

    // MARK: - Day Log Management

    func createDayLog(for date: Date = Date(), userId: String, title: String = "") -> DayLog {
        let dayLog = DayLog(date: date, userId: userId, title: title)
        dayLogs.insert(dayLog, at: 0)
        saveDayLogs()
        return dayLog
    }

    func getDayLog(for date: Date, userId: String) -> DayLog? {
        let calendar = Calendar.current
        return dayLogs.first { dayLog in
            dayLog.userId == userId &&
            calendar.isDate(dayLog.date, inSameDayAs: date)
        }
    }

    func getOrCreateDayLog(for date: Date = Date(), userId: String) -> DayLog {
        if let existing = getDayLog(for: date, userId: userId) {
            return existing
        }
        return createDayLog(for: date, userId: userId)
    }

    func deleteDayLog(_ dayLog: DayLog) {
        dayLogs.removeAll { $0.id == dayLog.id }
        saveDayLogs()
    }

    // MARK: - Todo Management

    func addTodo(title: String, description: String = "", to dayLogId: String, userId: String) {
        guard let index = dayLogs.firstIndex(where: { $0.id == dayLogId }) else { return }

        let todo = TodoItem(
            title: title,
            description: description,
            userId: userId,
            dayLogId: dayLogId
        )

        dayLogs[index].todos.append(todo)
        saveDayLogs()
    }

    func updateTodo(_ todo: TodoItem, in dayLogId: String) {
        guard let dayLogIndex = dayLogs.firstIndex(where: { $0.id == dayLogId }),
              let todoIndex = dayLogs[dayLogIndex].todos.firstIndex(where: { $0.id == todo.id }) else {
            return
        }

        dayLogs[dayLogIndex].todos[todoIndex] = todo
        saveDayLogs()
    }

    func toggleTodoCompletion(_ todo: TodoItem, in dayLogId: String) {
        guard let dayLogIndex = dayLogs.firstIndex(where: { $0.id == dayLogId }),
              let todoIndex = dayLogs[dayLogIndex].todos.firstIndex(where: { $0.id == todo.id }) else {
            return
        }

        dayLogs[dayLogIndex].todos[todoIndex].isCompleted.toggle()
        dayLogs[dayLogIndex].todos[todoIndex].completedAt = dayLogs[dayLogIndex].todos[todoIndex].isCompleted ? Date() : nil
        saveDayLogs()
    }

    func deleteTodo(_ todo: TodoItem, from dayLogId: String) {
        guard let index = dayLogs.firstIndex(where: { $0.id == dayLogId }) else { return }

        dayLogs[index].todos.removeAll { $0.id == todo.id }
        saveDayLogs()
    }

    func getUserDayLogs(userId: String) -> [DayLog] {
        dayLogs.filter { $0.userId == userId }
            .sorted { $0.date > $1.date }
    }

    // MARK: - Persistence

    private func saveDayLogs() {
        if let encoded = try? JSONEncoder().encode(dayLogs) {
            UserDefaults.standard.set(encoded, forKey: dayLogsKey)
        }
    }

    private func loadDayLogs() {
        if let data = UserDefaults.standard.data(forKey: dayLogsKey),
           let decoded = try? JSONDecoder().decode([DayLog].self, from: data) {
            dayLogs = decoded
        }
    }
}
