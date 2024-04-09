//
//  TodoListView.swift
//  BloomBuddyMobile
//
//  Created by Ivans Mihailovs on 08/04/2024.
//

import SwiftUI

struct TodoListView: View {
    let todos: [TodoListItem]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(Constants.Texts.careScheduleTodo)
                .font(.headline)
            List(todos.filter { $0.isDone }) { todo in
                Text(todo.title)
            }
        }
        .padding(.bottom, 20)
        
        VStack(alignment: .leading) {
            Text(Constants.Texts.careScheduleCompleted)
                .font(.headline)
            List(todos.filter { !$0.isDone }) { todo in
                Text(todo.title)
            }
        }
        
        Spacer()
    }
}

#Preview {
    TodoListView(todos: [
        TodoListItem(id: 1, title: "Fill water bottle", dueDate: Date(), isDone: true),
        TodoListItem(id: 2, title: "Water plant", dueDate: Date(), isDone: false),
        TodoListItem(id: 3, title: "Rotate towards the sun", dueDate: Date(), isDone: false)
    ])
}
