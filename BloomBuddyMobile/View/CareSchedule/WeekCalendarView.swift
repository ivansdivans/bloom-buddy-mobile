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

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Array(zip(viewModel.getDaysOfCurrentWeek(), viewModel.completionPercentageForCurrentWeek)), id: \.0) { day, completionPercentage in
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
                    .foregroundColor(customColorBasedOnCompletion(completionPercentage))
                    .background(Calendar.current.isDate(day, inSameDayAs: viewModel.selectedDate) ? Color.blue : Color.clear)
                    .cornerRadius(10)
                }
            }
        }
    }
    
    func customColorBasedOnCompletion(_ percentage: Double) -> Color {
        if percentage == 1.0 {
            return .green
        } else if percentage >= 0.5 {
            return .yellow
        } else {
            return .primary
        }
    }
}

#Preview {
    WeekCalendarView(viewModel: CareScheduleViewModel(), screenSize: .zero)
}
