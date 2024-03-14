//
//  PlantsView.swift
//  BloomBuddyMobile
//
//  Created by Daan Brocatus on 13/03/2024.
//

import SwiftUI

struct PlantsView: View {
    var plants: [String] = []
    @Binding var isRemoving: Bool
    var removePlant: (String) -> Void
    
    var body: some View {
        ScrollView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(plants, id: \.self) { plant in
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(red: 0.649, green: 0.741, blue: 0.572))
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                                .shadow(radius: 5)
                            VStack {
                                if isRemoving {
                                    HStack {
                                        Spacer()
                                        Button(action: {
                                            removePlant(plant)
                                            isRemoving = false
                                        }, label: {
                                            Image(systemName: "trash")
                                                .foregroundColor(.red)
                                        })
                                        .padding(10)
                                    }
                                    .frame(height: 50)
                                } else {
                                    HStack {}.frame(height: 50)
                                }
                                Text(plant)
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .multilineTextAlignment(.center)
                                Spacer()
                            }
                        }
                        .aspectRatio(1, contentMode: .fit)
                        .padding(10)
                    }
                }
            }
        }
    }
}
