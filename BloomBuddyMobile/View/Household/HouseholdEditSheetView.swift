//
//  HouseholdEditSheetView.swift
//  BloomBuddyMobile
//
//  Created by Daan Brocatus on 14/03/2024.
//

import SwiftUI

struct HouseholdEditSheetView: View {
    @Binding var isPresented: Bool
    @State var newName: String = ""
    var changeName: (String) -> Void
    var changeConfiguration: (HouseholdConfiguration) -> Void
    @State var currentConfiguration: HouseholdConfiguration
    
    var body: some View {
        VStack {
            HStack {
                Button("Cancel") {
                    isPresented.toggle()
                }
                .fontWeight(.bold)
                Spacer()
                Button("Save") {
                    isPresented.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        changeName(newName)
                        changeConfiguration(currentConfiguration)
                    }
                }
                .fontWeight(.bold)
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            LabeledTextFieldView(label: "Name", text: $newName)
                .padding(.vertical)
            HouseholdEditConfigurationView(configuration: $currentConfiguration)
            Spacer()
        }
        .padding(15)
    }
}
