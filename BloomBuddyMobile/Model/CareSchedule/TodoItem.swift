//
//  TodoItem.swift
//  BloomBuddyMobile
//
//  Created by Ivans Mihailovs on 08/04/2024.
//

import Foundation

struct TodoItem: Identifiable {
    public let id: Int
    public var plantNickName: String
    public var title: String
    public var dueDate: Date
    public var isDone: Bool = false
}
