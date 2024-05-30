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
            TodosView(viewModel: viewModel, type: CareScheduleViewModel.TodoType.todo)
                .padding(.bottom, 20)
            TodosView(viewModel: viewModel, type: CareScheduleViewModel.TodoType.completed)
        }
        Spacer()
    }
}

#Preview {
    TodoListView(viewModel: CareScheduleViewModel())
}
