//
//  WeekCalendarView.swift
//  BloomBuddyMobile
//
//  Created by Ivans Mihailovs on 07/04/2024.
//

import SwiftUI

struct WeekCalendarView: View {
    @ObservedObject private var viewModel = CareScheduleViewModel()
    let screenSize: CGSize
//    @State var isSelected: Bool = false // TODO: implement

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.getDaysOfCurrentWeek(), id: \.self) { day in
                    Button(action: {
//                        isSelected.toggle()
                        print("toggle isSelected bool for specific element, use id")
                    }) {
                        VStack {
                            Text(viewModel.getDayOfTheWeek(for: day))
                                .font(.headline)
                                .padding(.top, 10)
                            Spacer()
                            Text(viewModel.getDateOfTheMonth(for: day))
                                .font(.subheadline)
                                .padding(.bottom, 10)
                        }
                    }
                    .frame(width: screenSize.width / 8, height: 80)
                    .foregroundStyle(Color(viewModel.isToday(for: day) ? Color.red : Color.primary))
//                    .background(isSelected ? Color.blue : nil)
//                    .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    WeekCalendarView(screenSize: .zero)
}
