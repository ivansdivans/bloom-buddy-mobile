//
//  TodoListView.swift
//  BloomBuddyMobile
//
//  Created by Ivans Mihailovs on 08/04/2024.
//

import SwiftUI

struct TodoListView: View {
    @ObservedObject var viewModel: CareScheduleViewModel
    
    var body: some View {
        if !viewModel.hasTodos(for: viewModel.selectedDate) {
            ContentUnavailableView("No todos for today",
                                   systemImage: "checkmark.square")
        } else {
            VStack(alignment: .leading, spacing: 10) {
                Text(Constants.Texts.careScheduleTodo)
                    .font(.headline)
                ForEach(viewModel.careSchedule.todos.filter {
                    !$0.isDone && Calendar.current.isDate($0.dueDate, inSameDayAs: viewModel.selectedDate)
                }) { todo in
                    Button(action: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            viewModel.toggleTodo(todo)
                        }
                    }, label: {
                        HStack(spacing: 0) {
                            Image(systemName: "square")
                                .foregroundColor(.primary)
                                .padding(.trailing, 10)
                            Text(todo.title)
                                .foregroundStyle(Color.primary)
                        }
                    })
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 20)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(Constants.Texts.careScheduleCompleted)
                    .font(.headline)
                ForEach(viewModel.careSchedule.todos.filter {
                    $0.isDone && Calendar.current.isDate($0.dueDate, inSameDayAs: viewModel.selectedDate)
                }) { todo in
                    Button(action: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            viewModel.toggleTodo(todo)
                        }
                    }, label: {
                        HStack(spacing: 0) {
                            Image(systemName: "checkmark.square")
                                .foregroundColor(.primary)
                                .padding(.trailing, 10)
                            Text(todo.title)
                                .foregroundStyle(Color.primary)
                                .strikethrough()
                        }
                    })
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)

        }
                
        Spacer()
    }
}

#Preview {
    TodoListView(viewModel: CareScheduleViewModel())
}
