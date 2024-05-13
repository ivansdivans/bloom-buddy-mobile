//
//  LabeledTextView.swift
//  BloomBuddyMobile
//
//  Created by Daan Brocatus on 13/05/2024.
//

import SwiftUI

struct LabeledTextView: View {
    let label: String
    let text: String
    
    var body: some View {
        HStack {
            Text(label)
                .fontWeight(.bold)
            Spacer()
            Text(text)
        }.padding(.vertical, 2)
    }
}

#Preview {
    LabeledTextView(label: "label", text: "text")
}
