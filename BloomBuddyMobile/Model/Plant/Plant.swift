//
//  Plant.swift
//  BloomBuddyMobile
//
//  Created by Daan Brocatus on 25/04/2024.
//

import Foundation

struct Plant: Hashable {
    var nickName: String = ""
    var internalName: String
    var commonName: String
    var scientificName: String
    var imageUrl: String
    var wateringFrequency: PlantWateringFrequency
    var description: String
    var desiredTemperature: Double
    var careIntensity: PlantCareIntensity
    var careTakingInstructions: String
    var healthStatus: PlantHealthStatus
}
