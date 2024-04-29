//
//  Plant.swift
//  BloomBuddyMobile
//
//  Created by Daan Brocatus on 25/04/2024.
//

import Foundation

struct Plant {
    let nickName: String?
    let internalName: String
    let commonName: String
    let scientificName: String
    let imageUrl: String
    let wateringFrequency: PlantWateringFrequency
    let description: String
    let desiredTemperature: Double
    let careIntensity: PlantCareIntensity
    let careTakingInstructions: String
    let healthStatus: PlantHealthStatus
}
