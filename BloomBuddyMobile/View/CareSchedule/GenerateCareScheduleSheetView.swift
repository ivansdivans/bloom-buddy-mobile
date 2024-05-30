//
//  GenerateCareScheduleSheetView.swift
//  BloomBuddyMobile
//
//  Created by Ivans Mihailovs on 24/05/2024.
//

import SwiftUI

struct GenerateCareScheduleSheetView: View {    
    @ObservedObject var householdViewModel: HouseholdViewModel
    @State var selectedPlants: [Plant] = []
    var setSelectedPlants: ([Plant]) -> Void
    var generateCareSchedule: () -> Void
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Button("Cancel") {
                    dismiss()
                }
                .fontWeight(.bold)
                Spacer()
                Button("Generate") {
                    dismiss()
                    setSelectedPlants(selectedPlants)
                    generateCareSchedule()
                }
                .fontWeight(.bold)
                .disabled(selectedPlants.isEmpty)
            }
            .padding(.bottom, 20)
            
            VStack(spacing: 0) {
                if householdViewModel.household.plants.isEmpty {
                    ContentUnavailableView("Go to your household \nand add a plant",
                                           systemImage: "doc.text.magnifyingglass")
                } else {
                    Text("Select plants to be included in care schedule:")
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 10)
                    ForEach(householdViewModel.household.plants, id: \.self) { plant in
                        Button(action: {
                            if selectedPlants.contains(where: { $0.nickName == plant.nickName }) {
                                selectedPlants.removeAll(where: { $0.nickName == plant.nickName })
                            }
                            else {
                                self.selectedPlants.append(plant)
                            }
                        }) {
                            HStack {
                                Image(
                                    systemName: selectedPlants.contains(where: {
                                        $0.nickName == plant.nickName
                                    }) ? "checkmark.circle" : "circle"
                                )
                                .font(.body)
                                .foregroundStyle(Color.primary)
                                Text(plant.nickName)
                                    .font(.body)
                                    .foregroundStyle(Color.primary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(.bottom, 10)
                        }
                    }
                    
                }
                Spacer()
            }
        }
        .padding(15)
    }
}

#Preview {
    GenerateCareScheduleSheetView(
        householdViewModel: HouseholdViewModel(),
        setSelectedPlants: { plants in
            print("Preview setSelectedPlants called with \(plants.count) plants")
        },
        generateCareSchedule: {
            print("Preview generateCareSchedule called")
        }
    )
}
