//
//  HouseholdViewModelTests.swift
//  BloomBuddyMobileTests
//
//  Created by Daan Brocatus on 18/03/2024.
//

import XCTest
@testable import BloomBuddyMobile

final class HouseholdViewModelTests: XCTestCase {
    private var sut: HouseholdViewModel!
    private let testPlants = [
        Plant(
            nickName: "Sunny",
            internalName: "Monstera Deliciosa",
            commonName: "Swiss Cheese Plant",
            scientificName: "Monstera deliciosa",
            imageUrl: "https://example.com/monstera.jpg",
            wateringFrequency: .average,
            description: "A popular houseplant known for its distinctive foliage.",
            desiredTemperature: 20.0,
            careIntensity: .medium,
            careTakingInstructions: "Keep in a bright, indirect light and water when the top inch of soil is dry.",
            healthStatus: .good
        ),
        Plant(
            nickName: "Rosie",
            internalName: "Spathiphyllum",
            commonName: "Peace Lily",
            scientificName: "Spathiphyllum",
            imageUrl: "https://example.com/peace-lily.jpg",
            wateringFrequency: .little,
            description: "A flowering plant known for its elegant white flowers.",
            desiredTemperature: 18.0,
            careIntensity: .easy,
            careTakingInstructions: "Prefers low to medium light and regular watering.",
            healthStatus: .veryGood
        ),
        Plant(
            nickName: "Leafy",
            internalName: "Ficus lyrata",
            commonName: "Fiddle Leaf Fig",
            scientificName: "Ficus lyrata",
            imageUrl: "https://example.com/fiddle-leaf-fig.jpg",
            wateringFrequency: .average,
            description: "A popular indoor tree with large, violin-shaped leaves.",
            desiredTemperature: 22.0,
            careIntensity: .medium,
            careTakingInstructions: "Requires bright, indirect light and regular watering.",
            healthStatus: .good
        )
    ]
    private let additionalPlant = Plant(
        nickName: "Ruby",
        internalName: "Echeveria",
        commonName: "Echeveria",
        scientificName: "Echeveria",
        imageUrl: "https://example.com/echeveria.jpg",
        wateringFrequency: .veryLittle,
        description: "A succulent plant with beautiful rosette-shaped leaves.",
        desiredTemperature: 25.0,
        careIntensity: .easy,
        careTakingInstructions: "Prefers bright, indirect light and sparing watering.",
        healthStatus: .veryGood
    )

    
    override func setUpWithError() throws {
        sut = HouseholdViewModel()
        sut.household = Household(
            name: "Test household",
            plants: testPlants,
            configuration: HouseholdConfiguration(
                sunlight: .aLot,
                airQuality: 100,
                humidity: 77,
                averageTemperature: 20
            ))
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_changeConfiguration() {
        let newConfiguration = HouseholdConfiguration(
            sunlight: .veryLittle,
            airQuality: 200,
            humidity: 30,
            averageTemperature: 26
        )
        
        sut.changeConfiguration(newConfiguration)
        
        XCTAssertEqual(sut.household.configuration, newConfiguration)
    }
    
    func test_changeName() {
        let newName = "New name"
        
        sut.changeName(newName)
        
        XCTAssertEqual(sut.household.name, newName)
    }
    
    func test_changeName_outOfRange() {
        let newName = "New name that is by far way too long!"
        
        sut.changeName(newName)
        
        XCTAssertTrue(sut.showError)
    }
    
    func test_addPlant() {
        sut.newPlant = additionalPlant
        
        sut.addPlant()
        
        XCTAssertTrue(sut.household.plants.contains(additionalPlant))
    }
    
    func test_addPlant_outOfRange() {
        sut.newPlant = Plant(
            nickName: "Frost",
            internalName: "Calathea",
            commonName: "Calathea",
            scientificName: "Calathea",
            imageUrl: "https://example.com/calathea.jpg",
            wateringFrequency: .aboveAverage,
            description: "A genus of plants known for their striking foliage patterns.",
            desiredTemperature: 22.0,
            careIntensity: .medium,
            careTakingInstructions: "Keep in bright, indirect light and water regularly.",
            healthStatus: .good
        )
        sut.addPlant()
        sut.newPlant = Plant(
            nickName: "Blossom",
            internalName: "Hibiscus rosa-sinensis",
            commonName: "Hibiscus",
            scientificName: "Hibiscus rosa-sinensis",
            imageUrl: "https://example.com/hibiscus.jpg",
            wateringFrequency: .average,
            description: "A tropical flowering plant with large, colorful blossoms.",
            desiredTemperature: 25.0,
            careIntensity: .medium,
            careTakingInstructions: "Prefers full sun and regular watering.",
            healthStatus: .good
        )
        sut.addPlant()
        
        sut.newPlant = additionalPlant
        sut.addPlant()
        
        XCTAssertTrue(sut.showError)
    }
    
    func test_addPlant_alreadyExists() {
        sut.newPlant = sut.household.plants.first
        sut.addPlant()
        
        XCTAssertTrue(sut.showError)
    }
    
    func test_removePlant() {
        let nameToRemove = sut.household.plants.first?.nickName ?? ""
        sut.removePlant(nameToRemove)
        
        XCTAssertFalse(sut.household.plants.contains(where: { $0.nickName == nameToRemove }))
    }
    
    func test_removePlant_notFound() {
        sut.removePlant("nonExistantPlant")
        
        XCTAssertTrue(sut.showError)
    }
}
