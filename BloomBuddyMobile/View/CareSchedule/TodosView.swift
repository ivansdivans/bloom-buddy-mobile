//
//  TodosView.swift
//  BloomBuddyMobile
//
//  Created by Ivans Mihailovs on 30/05/2024.
//

import SwiftUI

struct TodosView: View {
    @ObservedObject var viewModel: CareScheduleViewModel
    let type: CareScheduleViewModel.TodoType
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(type == .todo ? Constants.Texts.careScheduleTodo : Constants.Texts.careScheduleCompleted)
                .font(.headline)
            ForEach(viewModel.careSchedule.todos.filter {
                (type == .todo ? !$0.isDone : $0.isDone)
                && Calendar.current.isDate($0.dueDate, inSameDayAs: viewModel.selectedDate)
            }) { todo in
                Button(action: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        viewModel.toggleTodo(todo)
                    }
                }, label: {
                    HStack(spacing: 0) {
                        Image(systemName: type == .todo ? "square" : "checkmark.square")
                            .foregroundColor(.primary)
                            .padding(.trailing, 10)
                        Text(todo.title)
                            .foregroundStyle(Color.primary)
                            .strikethrough(type == .completed)
                    }
                })
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    TodosView(viewModel: CareScheduleViewModel(), type: CareScheduleViewModel.TodoType.todo)
}
