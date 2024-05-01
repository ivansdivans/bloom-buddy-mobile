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
    var addPlant: () -> Void
    
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
                        addPlant()
                    }
                }
                .fontWeight(.bold)
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            
            ScrollView {
                VStack {
                    LabeledTextView(label: "Nickname", text: $plant.nickName)
                    LabeledTextView(label: "Internal name", text: $plant.internalName)
                    LabeledTextView(label: "Common name", text: $plant.commonName)
                    LabeledTextView(label: "Scientific name", text: $plant.scientificName)
                    Spacer(minLength: 20)
                    LabeledTextAreaView(label: "Image URL", text: $plant.imageUrl)
                    LabeledTextAreaView(label: "Description", text: $plant.description)
                    LabeledTextAreaView(label: "Caretaking instructions", text: $plant.careTakingInstructions)
                    VStack {
                        HStack {
                            Text("Desired temperature: \(String(format: "%.1f", plant.desiredTemperature))C")
                                .fontWeight(.bold)
                            Spacer()
                        }
                        Slider(value: $plant.desiredTemperature, in: 10...30, step: 0.1)
                    }.padding(.vertical)
                    LabeledEnumPicker(label: "Watering frequency:", selection: $plant.wateringFrequency, options: PlantWateringFrequency.allCases, displayText: { $0.displayText })
                    LabeledEnumPicker(label: "Care intensity:", selection: $plant.careIntensity, options: PlantCareIntensity.allCases, displayText: { $0.displayText })
                    LabeledEnumPicker(label: "Health status:", selection: $plant.healthStatus, options: PlantHealthStatus.allCases, displayText: { $0.displayText })
                }
            }
            
            Spacer()
        }
        .padding(15)
    }
}
