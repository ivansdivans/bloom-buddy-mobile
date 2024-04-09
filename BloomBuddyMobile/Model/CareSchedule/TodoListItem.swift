//
//  TodoListItem.swift
//  BloomBuddyMobile
//
//  Created by Ivans Mihailovs on 08/04/2024.
//

import Foundation

struct TodoListItem: Identifiable {
    public var id: Int
    public var title: String
    public var dueDate: Date
    public var isDone: Bool
    
    init(id: Int, title: String, dueDate: Date, isDone: Bool) {
        self.id = id
        self.title = title
        self.dueDate = dueDate
        self.isDone = isDone
    }
    
    init() {
        self.id = 123
        self.title = ""
        self.dueDate = Date()
        self.isDone = false
    }
}
