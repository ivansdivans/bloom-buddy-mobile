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
        VStack {
            Text(Constants.Texts.careScheduleTitle)
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Text(viewModel.getCurrentMonthAndYear())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 10)
            
            WeekCalendarView(screenSize: screenSize)
            .padding(.bottom, 10)
            Divider()
                .padding(.bottom, 10)
            
            ScrollView(.vertical, showsIndicators: false) {
                // Replace with lists
//                List(todos) { todo in
//                    
//                }
                VStack {
                    Text(Constants.Texts.careScheduleTodo)
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    VStack {
                        Text("Dummy todo item #1")
                        Text("Dummy todo item #2")
                        Text("Dummy todo item #3")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.bottom, 20)
                
                VStack {
                    Text(Constants.Texts.careScheduleCompleted)
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    VStack {
                        Text("Dummy todo item #4")
                        Text("Dummy todo item #5")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.bottom, 20)
                
                Spacer()
            }
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
