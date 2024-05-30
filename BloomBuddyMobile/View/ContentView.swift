//
//  ContentView.swift
//  BloomBuddyMobile
//
//  Created by Ivans Mihailovs on 26/02/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject private var careScheduleViewModel = CareScheduleViewModel()
    @StateObject private var householdViewModel = HouseholdViewModel()
    
    var body: some View {
        TabView {
            CareScheduleView(
                careScheduleViewModel: careScheduleViewModel,
                householdViewModel: householdViewModel
            )
                .tabItem {
                    Label("Care schedule", systemImage: "calendar")
                }
            HouseholdView(viewModel: householdViewModel)
                .tabItem {
                    Label("Household", systemImage: "house")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    ContentView()
}
