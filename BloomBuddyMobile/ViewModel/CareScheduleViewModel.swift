//
//  CareScheduleViewModel.swift
//  BloomBuddyMobile
//
//  Created by Ivans Mihailovs on 07/04/2024.
//

import Foundation
import SwiftUI

class CareScheduleViewModel: ObservableObject {
    // TODO: move to new file TodoListViewModel
    @Published var todos: [TodoListItem] = [
        TodoListItem(id: 1, title: "Fill water bottle", dueDate: Date(), isDone: true),
        TodoListItem(id: 2, title: "Water plant", dueDate: Date(), isDone: true),
        TodoListItem(id: 3, title: "Rotate towards the sun", dueDate: Date(), isDone: false),
        TodoListItem(id: 4, title: "Open window", dueDate: Date(), isDone: false),
        TodoListItem(id: 5, title: "Pet your plant", dueDate: Date(), isDone: false)
    ]
    
    let currentDate: Date = Date()
    
    func getCurrentMonthAndYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM, yyyy"
        return dateFormatter.string(from: currentDate)
    }
    
    // TODO: move to new file WeekCalendarViewModel
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
}

struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

