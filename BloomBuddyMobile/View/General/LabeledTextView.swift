//
//  LabeledTextView.swift
//  BloomBuddyMobile
//
//  Created by Daan Brocatus on 01/05/2024.
//

import SwiftUI

struct LabeledTextView: View {
    var label: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Text(label + ":")
                .fontWeight(.bold)
            Spacer()
            TextField("", text: $text)
                .textFieldStyle(.roundedBorder)
        }
    }
}
