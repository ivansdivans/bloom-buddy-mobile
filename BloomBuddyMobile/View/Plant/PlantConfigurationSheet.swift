//
//  PlantConfigurationSheet.swift
//  BloomBuddyMobile
//
//  Created by Daan Brocatus on 29/04/2024.
//

import SwiftUI

struct PlantConfigurationSheet: View {
    @Binding var isPresented: Bool
    @Binding var plant: Plant
    
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
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//                        changeName(newName)
//                        changeConfiguration(currentConfiguration)
//                    }
                }
                .fontWeight(.bold)
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            
            Text(plant.commonName)
            
            Spacer()
        }
        .padding(15)
    }
}
