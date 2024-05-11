//
//  LocalJSONAPIModels.swift
//  BloomBuddyMobile
//
//  Created by Daan Brocatus on 29/04/2024.
//

import Foundation

struct APIPlant: Decodable {
    let name: APIName
    let imageUrl: String
    let wateringFrequency: Int
    let description: String
    let desiredTemperature: Double
    let careIntensity: Int
    let careTakingInstructions: String
}

struct APIName: Decodable {
    let internalName: String
    let commonName: String
    let scientificName: String

    private enum CodingKeys: String, CodingKey {
        case internalName = "internal"
        case commonName = "common"
        case scientificName = "scientific"
    }
}
