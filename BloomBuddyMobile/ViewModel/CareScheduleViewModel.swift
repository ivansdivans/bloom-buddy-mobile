//
//  CareScheduleViewModel.swift
//  BloomBuddyMobile
//
//  Created by Ivans Mihailovs on 07/04/2024.
//

import Foundation
import SwiftUI

class CareScheduleViewModel: ObservableObject {
    // MARK: CareScheduleView
    @Published var careSchedule: CareSchedule = CareSchedule(
        id: 1,
        plants: [],
        todos: []
    )
    @Published var isCreatingCareSchedule = false
    
    func setSelectedPlants(plantsArr: [Plant]) -> Void {
        careSchedule.plants = plantsArr
    }
    
    func generateCareSchedule() -> Void {
        print("generateCareSchedule called") // TODO: focus on this
    }
    
    let currentDate: Date = Date()
    
    func getCurrentMonthAndYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM, yyyy"
        return dateFormatter.string(from: currentDate)
    }
    
    // MARK: WeekCalendarView
    @Published var selectedDate: Date = Date()
    
    func getDaysOfCurrentWeek() -> [Date] {
        let calendar: Calendar = Calendar.current
        let startOfWeek = calendar.date(
            from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: currentDate)
        ) ?? .now
        var days: [Date] = []
        
        for i in 0..<7 {
            if let day = calendar.date(byAdding: .day, value: i, to: startOfWeek) {
                days.append(day)
            }
        }
        return days
    }
    
    func getDayOfTheWeek(for date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: date)
    }
    
    func getDateOfTheMonth(for date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter.string(from: date)
    }
    
    func isToday(for date: Date) -> Bool {
        return Calendar.current.isDateInToday(date)
    }
    
    // MARK: TodoListView
    @Published var todos: [TodoItem] = [
        // yesterday
        TodoItem(id: 1, title: "Water plant", dueDate: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date(), isDone: false),
        TodoItem(id: 2, title: "Open window", dueDate: Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date(), isDone: false),
        // today
        TodoItem(id: 3, title: "Fill water bottle", dueDate: Date(), isDone: true),
        TodoItem(id: 4, title: "Rotate towards the sun", dueDate: Date(), isDone: false),
        TodoItem(id: 5, title: "Water plant", dueDate: Date(), isDone: true),
        TodoItem(id: 6, title: "Open window", dueDate: Date(), isDone: false),
        TodoItem(id: 7, title: "Pet your plant", dueDate: Date(), isDone: false),
        // tomorrow
        TodoItem(id: 8, title: "Water plant", dueDate: Calendar.current.date(byAdding: .day, value: +1, to: Date()) ?? Date(), isDone: false),
        TodoItem(id: 9, title: "Open window", dueDate: Calendar.current.date(byAdding: .day, value: +1, to: Date()) ?? Date(), isDone: false)
    ]
    
    func toggleTodo(_ todo: TodoItem) {
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index].isDone.toggle()
        }
    }
    
    var completionPercentageForCurrentWeek: [Double] {
        get {
            return getDaysOfCurrentWeek().map { day in
                let todosForDay = todos.filter { Calendar.current.isDate($0.dueDate, inSameDayAs: day) }
                let completedTodosCount = todosForDay.filter { $0.isDone }.count
                return Double(completedTodosCount) / Double(todosForDay.count)
            }
        }
    }
}

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}
