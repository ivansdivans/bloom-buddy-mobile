//
//  CareSchedule.swift
//  BloomBuddyMobile
//
//  Created by Ivans Mihailovs on 23/05/2024.
//

import Foundation

struct CareSchedule: Identifiable {
    public let id: Int
    public var plants: [Plant]
    public var todos: [TodoItem]
}
