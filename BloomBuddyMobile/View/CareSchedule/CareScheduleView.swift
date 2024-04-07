//
//  CareScheduleView.swift
//  BloomBuddyMobile
//
//  Created by Ivans Mihailovs on 10/03/2024.
//

import SwiftUI

struct CareScheduleView: View {
    @ObservedObject private var viewModel = CareScheduleViewModel()
    
    var body: some View {
        Text("My Care Schedule")
    }
}

#Preview {
    CareScheduleView()
}
