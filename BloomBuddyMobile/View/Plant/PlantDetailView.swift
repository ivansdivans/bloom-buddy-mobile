//
//  PlantDetailView.swift
//  BloomBuddyMobile
//
//  Created by Daan Brocatus on 12/05/2024.
//

import SwiftUI

struct PlantDetailView: View {
    var plant: Plant
    
    var body: some View {
        ScrollView {
            HStack {
                Text(plant.nickName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            HStack {
                Text("\(plant.commonName) - \(plant.scientificName)")
                Spacer()
            }
            .padding(.top, 0)
            ImageView(url: plant.imageUrl)
            HStack {
                Text("Description")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            HStack {
                Text(plant.description)
                Spacer()
            }
            Spacer(minLength: 20)
            HStack {
                Text("Caretaking")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.vertical, 2)
            LabeledTextView(label: "Health status", text: plant.healthStatus.displayText)
            LabeledTextView(label: "Care intensity", text: plant.careIntensity.displayText)
            LabeledTextView(label: "Desired temperature", text: "\(String(format: "%.2f", plant.desiredTemperature)) C")
            LabeledTextView(label: "Watering frequency", text: plant.wateringFrequency.displayText)
            Spacer(minLength: 20)
            HStack {
                Text("Caretaking instructions")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            HStack {
                Text(plant.careTakingInstructions)
                Spacer()
            }
        }
        .padding(10)
    }
}

#Preview {
    PlantDetailView(plant: Plant(
        nickName: "Frost",
        internalName: "Calathea",
        commonName: "Calathea",
        scientificName: "Calathea",
        imageUrl: "https://cdn-bcjcmcp.nitrocdn.com/waWVOFeTTjfsrexCStUChPfDPlZkUHTy/assets/images/optimized/rev-bd6aa80/highlandmoss.com/wp-content/uploads/2023/07/img_4260-jpg-1152x1536.webp",
        wateringFrequency: .aboveAverage,
        description: "A genus of plants known for their striking foliage patterns.",
        desiredTemperature: 22.0,
        careIntensity: .medium,
        careTakingInstructions: "Keep in bright, indirect light and water regularly. Lorem ipsum dolor sit amet.",
        healthStatus: .good
    ))
}
