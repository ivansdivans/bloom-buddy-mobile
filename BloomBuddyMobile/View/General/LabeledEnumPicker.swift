//
//  LabeledEnumPicker.swift
//  BloomBuddyMobile
//
//  Created by Daan Brocatus on 01/05/2024.
//

import SwiftUI

struct LabeledEnumPicker<T: Equatable & CaseIterable & Hashable>: View {
    var label: String
    @Binding var selection: T
    var options: [T]
    var displayText: (T) -> String
    
    var body: some View {
        HStack {
            Text(label + ":")
                .fontWeight(.bold)
            Spacer()
            Picker("Select \(label)", selection: $selection) {
                ForEach(options, id: \.self) { option in
                    Text(displayText(option)).tag(option)
                }
            }
            .pickerStyle(MenuPickerStyle())
        }
    }
}
