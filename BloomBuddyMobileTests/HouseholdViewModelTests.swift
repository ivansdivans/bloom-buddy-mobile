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

    override func setUpWithError() throws {
        sut = HouseholdViewModel()
        sut.household = Household(
            name: "Test household",
            plants: ["testPlant1", "testPlant2", "testPlant3"],
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
        let newPlant = "New plant"
        
        sut.addPlant(newPlant)
        
        XCTAssertTrue(sut.household.plants.contains(newPlant))
    }
    
    func test_addPlant_outOfRange() {
        let newPlant = "New plant"
        sut.addPlant("testPlant4")
        sut.addPlant("testPlant5")
        
        sut.addPlant(newPlant)
        
        XCTAssertTrue(sut.showError)
    }
    
    func test_addPlant_alreadyExists() {
        sut.addPlant(sut.household.plants.first!)
        
        XCTAssertTrue(sut.showError)
    }
    
    func test_removePlant() {
        let plantToRemove = "testPlant1"
        sut.removePlant(plantToRemove)
        
        XCTAssertFalse(sut.household.plants.contains(plantToRemove))
    }
    
    func test_removePlant_notFound() {
        sut.removePlant("nonExistantPlant")
        
        XCTAssertTrue(sut.showError)
    }
}
