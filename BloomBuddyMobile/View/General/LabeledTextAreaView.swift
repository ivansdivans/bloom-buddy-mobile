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
        VStack(alignment: .leading, spacing: 8) {
            Text(label)
                .fontWeight(.bold)
            TextEditor(text: $text)
                .frame(minHeight: 100)
                .padding(.all, 2)
        }.padding(.vertical, 5)
    }
}
