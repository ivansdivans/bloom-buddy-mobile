//
//  WeekCalendarView.swift
//  BloomBuddyMobile
//
//  Created by Ivans Mihailovs on 07/04/2024.
//

import SwiftUI

struct WeekCalendarView: View {
    @ObservedObject var viewModel: CareScheduleViewModel
    let screenSize: CGSize

    // TODO: days in the care schedule are colored from red to green, based on to-do completion progress
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.getDaysOfCurrentWeek(), id: \.self) { day in
                    Button(action: {
                        viewModel.selectedDate = day
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
                    .background(Calendar.current.isDate(day, inSameDayAs: viewModel.selectedDate) ? Color.blue : Color.clear)
                    .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    WeekCalendarView(viewModel: CareScheduleViewModel(), screenSize: .zero)
}
