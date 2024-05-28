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
    
    func generateCareSchedule() {
        var todos: [TodoItem] = []
        for plant in careSchedule.plants {
            let schedule = getSchedule(for: plant.wateringFrequency)
            for (index, day) in schedule.enumerated() {
                todos.append(
                    TodoItem(
                        id: todos.count + 1,
                        plantNickName: plant.nickName,
                        title: "Water \(plant.nickName)",
                        dueDate: findUpcoming(day: day),
                        isDone: false
                    )
                )
            }
        }
        careSchedule.todos = todos
    }
    
    private func getSchedule(for frequency: PlantWateringFrequency) -> [Int] {
        switch frequency {
        case .veryLittle: return [1]
        case .little: return [1, 4]
        case .average: return [1, 3, 5]
        case .aboveAverage: return [1, 2, 4, 6]
        case .aLot: return [1, 2, 3, 4, 5, 6, 7]
        }
    }
    
    func findUpcoming(day: Int, from date: Date = Date()) -> Date {
        let calendar = Calendar.current
        let currentWeekday = calendar.component(.weekday, from: date)
        let daysToAdd = (day - currentWeekday + 7) % 7
        return calendar.date(byAdding: .day, value: daysToAdd, to: date) ?? Date()
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
    func toggleTodo(_ todo: TodoItem) {
        if let index = careSchedule.todos.firstIndex(where: { $0.id == todo.id }) {
            careSchedule.todos[index].isDone.toggle()
        }
    }
    
    var completionPercentageForCurrentWeek: [Double] {
        get {
            return getDaysOfCurrentWeek().map { day in
                let todosForDay = careSchedule.todos.filter { Calendar.current.isDate($0.dueDate, inSameDayAs: day) }
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
