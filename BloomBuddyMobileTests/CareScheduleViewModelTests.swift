//
//  CareScheduleViewModelTests.swift
//  BloomBuddyMobileTests
//
//  Created by Ivans Mihailovs on 13/05/2024.
//

import XCTest
@testable import BloomBuddyMobile

final class CareScheduleViewModelTests: XCTestCase {
    private var sut: CareScheduleViewModel!
    
    override func setUpWithError() throws {
        sut = CareScheduleViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_getCurrentMonthAndYear() {
        let result = sut.getCurrentMonthAndYear()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM, yyyy"
        XCTAssertEqual(result, dateFormatter.string(from: Date()))
    }
    
    func test_selectedDate() {
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date()
        sut.selectedDate = yesterday
        XCTAssertEqual(sut.selectedDate, yesterday)
        
        let tomorrow = Calendar.current.date(byAdding: .day, value: +1, to: Date()) ?? Date()
        sut.selectedDate = tomorrow
        XCTAssertEqual(sut.selectedDate, tomorrow)
    }

    func test_getDaysOfCurrentWeek() {
        let days = sut.getDaysOfCurrentWeek()
        XCTAssertEqual(days.count, 7)
        
        let sortedDays = days.sorted()
        XCTAssertEqual(days, sortedDays)
    }
    
    func test_getDayOfTheWeek() {
        let bloomBuddyDemoDate = DateComponents(calendar: .current, year: 2024, month: 5, day: 31).date ?? Date()
        let timeInterval = bloomBuddyDemoDate.timeIntervalSince1970
        let date = Date(timeIntervalSince1970: timeInterval)
        let dayOfWeek = sut.getDayOfTheWeek(for: date)
        XCTAssertEqual(dayOfWeek, "Fri")
    }
    
    func test_getDateOfTheMonth() {
        let bloomBuddyDemoDate = DateComponents(calendar: .current, year: 2024, month: 5, day: 31).date ?? Date()
        let timeInterval = bloomBuddyDemoDate.timeIntervalSince1970
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateOfMonth = sut.getDateOfTheMonth(for: date)
        XCTAssertEqual(dateOfMonth, "31")
    }
    
    func test_toggleToDo() {
        sut.todos = [
            TodoItem(id: 1, plantNickName: "testBuddy", title: "Test todo", dueDate: Date(), isDone: true),
            TodoItem(id: 2, plantNickName: "testBuddy", title: "Test todo", dueDate: Date(), isDone: true)
        ]
        let currentTodoState = sut.todos[0].isDone
        sut.toggleTodo(sut.todos[0])
        let newTodoState = sut.todos[0].isDone
        XCTAssertNotEqual(currentTodoState, newTodoState)
    }
    
    func test_completionPercentageForCurrentWeek() {
        let daysOfCurrentWeek: [Date] = sut.getDaysOfCurrentWeek()
        let mondayOfCurrentWeek = daysOfCurrentWeek[0]
        let tuesdayOfCurrentWeek = daysOfCurrentWeek[1]
        let wednesdayOfCurrentWeek = daysOfCurrentWeek[2]
        sut.todos = [
            TodoItem(id: 1, plantNickName: "testBuddy", title: "Monday todo 1", dueDate: mondayOfCurrentWeek, isDone: true),
            TodoItem(id: 2, plantNickName: "testBuddy", title: "Monday todo 2", dueDate: mondayOfCurrentWeek, isDone: true),
            TodoItem(id: 3, plantNickName: "testBuddy", title: "Tuesday todo 1", dueDate: tuesdayOfCurrentWeek, isDone: true),
            TodoItem(id: 4, plantNickName: "testBuddy", title: "Tuesday todo 2", dueDate: tuesdayOfCurrentWeek, isDone: false),
            TodoItem(id: 8, plantNickName: "testBuddy", title: "Wednesday todo 1", dueDate: wednesdayOfCurrentWeek, isDone: false),
            TodoItem(id: 9, plantNickName: "testBuddy", title: "Wednesday todo 2", dueDate: wednesdayOfCurrentWeek, isDone: false)
        ]
        let completionPercentages = sut.completionPercentageForCurrentWeek
        XCTAssertEqual(completionPercentages[0], 1.0)
        XCTAssertEqual(completionPercentages[1], 0.5)
        XCTAssertEqual(completionPercentages[2], 0.0)
    }
}
