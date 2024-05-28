//
//  HouseholdView.swift
//  BloomBuddyMobile
//
//  Created by Ivans Mihailovs on 10/03/2024.
//

import SwiftUI

struct HouseholdView: View {
    @ObservedObject var viewModel: HouseholdViewModel
    @State private var isRemoving = false
    @State private var isAdding = false
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    HStack {
                        Text(viewModel.household.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    HStack {
                        Text("\(viewModel.household.plantCount) plants")
                        Spacer()
                    }
                }
                HStack {
                    Button(action: {
                        viewModel.isConfiguring.toggle()
                    }, label: {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.primary)
                        .font(.title) })
                    Button(action: {
                        isRemoving.toggle()
                    }, label: {
                        Image(systemName: isRemoving ? "trash.slash" : "trash")
                            .foregroundColor(.primary)
                            .font(.title)
                    })
                }
            }
            if viewModel.household.plants.isEmpty {
                ContentUnavailableView(
                    label: {Label("You have no plants yet.\nLet's add one.", systemImage: "plus.circle")},
                    actions: {
                        Button(action: {
                            isAdding.toggle()
                        }, label: {
                            Text("Add a plant")
                        })
                        .buttonStyle(.borderedProminent)
                        .padding(.top, 30)
                        .sheet(isPresented: $isAdding) {
                            ImagePicker(selectedImage: $viewModel.selectedImage)
                        }
                    })
            } else {
                PlantsGridView(plants: viewModel.household.plants, isRemoving: $isRemoving, removePlant: viewModel.removePlant)
                Button(action: {
                    isAdding.toggle()
                }, label: {
                    Text("Add a plant")
                        .frame(maxWidth: .infinity)
                })
                .sheet(isPresented: $isAdding) {
                    ImagePicker(selectedImage: $viewModel.selectedImage)
                }
                .buttonStyle(.borderedProminent)
                .padding(.horizontal, 10)
            }
            Spacer()
        }
        .padding(10)
        .sheet(isPresented: $viewModel.isConfiguring) {
            HouseholdEditSheetView(
                isPresented: $viewModel.isConfiguring,
                newName: viewModel.household.name,
                changeName: viewModel.changeName,
                changeConfiguration: viewModel.changeConfiguration,
                currentConfiguration: viewModel.household.configuration
            )
        }
        .sheet(isPresented: $viewModel.isAdding) {
            PlantConfigurationSheet(isPresented: $viewModel.isAdding, plant: $viewModel.newPlant, addPlant: viewModel.addPlant)
        }
        .alert(isPresented: $viewModel.showError) { Alert(
            title: Text("Error"),
            message: Text(viewModel.errorMessage),
            dismissButton: .default(Text("OK")) {
                viewModel.showError = false
            }
        )
        }
    }
}
