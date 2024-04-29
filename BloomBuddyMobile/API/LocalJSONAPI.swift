//
//  LocalJSONAPI.swift
//  BloomBuddyMobile
//
//  Created by Daan Brocatus on 25/04/2024.
//

import Foundation

class LocalJSONAPI: API {
    func getPlantByName(_ name: String) throws -> Plant {
        do {
            let allPlants = try getLocalPlantData()
            let allPlantsFormatted = formatAPIPlants(allPlants)
            guard let plant = allPlantsFormatted.first(where: { $0.internalName == name }) else {
                throw PropertyError.notFound("Plant with name \(name) not found!")
            }
            return plant
        } catch {
            throw error
        }
    }
    
    private func getLocalPlantData() throws -> [APIPlant] {
        guard let jsonURL = Bundle.main.url(forResource: "plant-data", withExtension: "json") else {
            fatalError("Failed to locate JSON file in bundle.")
        }
        
        do {
            let jsonData = try Data(contentsOf: jsonURL)
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode([APIPlant].self, from: jsonData)
            
            return decodedData
        } catch {
            throw JSONError.decodingError(error.localizedDescription)
        }
    }
    
    private func formatAPIPlants(_ apiPlants: [APIPlant]) -> [Plant] {
        let plants = apiPlants.map { apiPlant in
            return Plant(nickName: nil,
                         internalName: apiPlant.name.internalName,
                         commonName: apiPlant.name.commonName,
                         scientificName: apiPlant.name.scientificName,
                         imageUrl: apiPlant.imageUrl,
                         wateringFrequency: PlantWateringFrequency(intValue: apiPlant.wateringFrequency) ?? .average,
                         description: apiPlant.description,
                         desiredTemperature: apiPlant.desiredTemperature,
                         careIntensity: PlantCareIntensity(intValue: apiPlant.careIntensity) ?? .medium,
                         careTakingInstructions: apiPlant.careTakingInstructions,
                         healthStatus: .okay)
        }
        return plants
    }
}
