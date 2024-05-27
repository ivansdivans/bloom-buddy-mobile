//
//  CareScheduleView.swift
//  BloomBuddyMobile
//
//  Created by Ivans Mihailovs on 10/03/2024.
//

import SwiftUI

struct CareScheduleView: View {
    @ObservedObject var careScheduleViewModel: CareScheduleViewModel
    @ObservedObject var householdViewModel: HouseholdViewModel
    @State var screenSize: CGSize = .zero
    
    var body: some View {
        VStack(spacing: 0) {
            Text(Constants.Texts.careScheduleTitle)
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Text(careScheduleViewModel.getCurrentMonthAndYear())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 10)
            
            if careScheduleViewModel.careSchedule.plants.isEmpty {
                ContentUnavailableView(label: {
                    Label("You don't have \ncare schedule yet", systemImage: "calendar.badge.plus")
                },
                                       actions: {
                    Button(action: {
                        careScheduleViewModel.isCreatingCareSchedule.toggle()
                    }, label: {
                        Text("Create care schedule")
                    })
                    .buttonStyle(.borderedProminent)
                    .padding(.top, 30)
                    .sheet(isPresented: $careScheduleViewModel.isCreatingCareSchedule) {
                        GenerateCareScheduleSheetView(
                            householdViewModel: householdViewModel,
                            setSelectedPlants: { selectedPlants in
                                careScheduleViewModel.setSelectedPlants(plantsArr: selectedPlants)
                            },
                            generateCareSchedule: careScheduleViewModel.generateCareSchedule
                        )
                    }
                })
            } else {
                WeekCalendarView(viewModel: careScheduleViewModel, screenSize: screenSize)
                    .padding(.bottom, 10)
                
                Divider()
                    .padding(.bottom, 20)
                
                TodoListView(viewModel: careScheduleViewModel)
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
    CareScheduleView(
        careScheduleViewModel: CareScheduleViewModel(),
        householdViewModel: HouseholdViewModel()
    )
}
