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
        VStack(alignment: .leading, spacing: 10) {
            Text(Constants.Texts.careScheduleTodo)
                .font(.headline)
            ForEach(todos.filter { $0.isDone }) { todo in
                Button(action: {
                    print("mark todo as done") // TODO: implement
                }, label: {
                    HStack(spacing: 0) {
                        Image(systemName: "square")
                            .foregroundColor(.primary)
                            .padding(.trailing, 10)
                        Text(todo.title)
                            .foregroundStyle(Color.black)
                    }
                })
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 20)
        
        VStack(alignment: .leading, spacing: 10) {
            Text(Constants.Texts.careScheduleCompleted)
                .font(.headline)
            ForEach(todos.filter { !$0.isDone }) { todo in
                Button(action: {
                    print("mark todo as NOTdone") // TODO: implement
                }, label: {
                    HStack(spacing: 0) {
                        Image(systemName: "checkmark.square")
                            .foregroundColor(.primary)
                            .padding(.trailing, 10)
                        Text(todo.title)
                            .foregroundStyle(Color.black)
                            .strikethrough()
                    }
                })
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
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
