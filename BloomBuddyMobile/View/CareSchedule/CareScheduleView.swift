//
//  CareScheduleView.swift
//  BloomBuddyMobile
//
//  Created by Ivans Mihailovs on 10/03/2024.
//

import SwiftUI

struct CareScheduleView: View {
    @ObservedObject private var viewModel = CareScheduleViewModel()
    @State var screenSize: CGSize = .zero
    
    var body: some View {
        VStack(spacing: 0) {
            Text(Constants.Texts.careScheduleTitle)
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Text(viewModel.getCurrentMonthAndYear())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 10)
            
            WeekCalendarView(viewModel: viewModel, screenSize: screenSize)
            .padding(.bottom, 10)
            
            Divider()
                .padding(.bottom, 20)
            
            TodoListView(viewModel: viewModel)
        }
        .padding(10)
        .overlay(
            GeometryReader { proxy in
                Color.clear.preference(key: SizePreferenceKey.self, value: proxy.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self) { value in
            screenSize = value
        }
    }
}

#Preview {
    CareScheduleView()
}
