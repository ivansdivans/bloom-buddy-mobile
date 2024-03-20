//
//  ContentView.swift
//  BloomBuddyMobile
//
//  Created by Ivans Mihailovs on 26/02/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            CareScheduleView()
                .tabItem {
                    Label("Care schedule", systemImage: "calendar")
                }
            HouseholdView()
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
