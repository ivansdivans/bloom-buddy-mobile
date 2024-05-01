//
//  LabeledTextAreaView.swift
//  BloomBuddyMobile
//
//  Created by Daan Brocatus on 01/05/2024.
//

import SwiftUI

struct LabeledTextAreaView: View {
    var label: String
    @Binding var text: String
    
    var body: some View {
        VStack {
            HStack {
                Text(label)
                    .fontWeight(.bold)
                Spacer()
            }
            TextEditor(text: $text)
                .textFieldStyle(.roundedBorder)
        }
    }
}
