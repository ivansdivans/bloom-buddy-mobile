//
//  HouseholdViewModel.swift
//  BloomBuddyMobile
//
//  Created by Daan Brocatus on 13/03/2024.
//

import Foundation
import SwiftData

class HouseholdViewModel: ObservableObject {
    @Published var household: Household = Household()
    @Published var showError = false
    @Published var errorMessage = ""
    
    func changeConfiguration(_ config: HouseholdConfiguration) {
        household.configuration = config
    }
    
    func changeName(_ name: String) {
        do {
            try _changeName(name)
        } catch let error as PropertyError {
            switch error {
            case .outOfRange(let msg):
                errorMessage = msg
                showError = true
            case .notFound(_), .alreadyExists(_):
                print("An unexpected error occurred: \(error)")
            }
        } catch {
            print("An unexpected error occurred: \(error)")
        }
        print(household.name)
    }
    
    func _changeName(_ name: String) throws {
        let newName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard (4...32).contains(newName.count) else {
            throw PropertyError.outOfRange("Your household name needs to be between 4 and 32 characters!")
        }
        
        household.name = newName
    }
    
    func addPlant(_ name: String) {
        do {
            try _addPlant(name)
        } catch let error as PropertyError {
            switch error {
            case .outOfRange(let msg), .alreadyExists(let msg):
                errorMessage = msg
                showError = true
            case .notFound(_):
                print("An unexpected error occurred: \(error)")
            }
        } catch {
            print("An unexpected error occurred: \(error)")
        }
    }
    
    private func _addPlant(_ name: String) throws {
        let nameToAdd = name.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard household.plants.count < 5 else {
            throw PropertyError.outOfRange("You can only have up to 5 plants!")
        }
        
        guard !household.plants.contains(nameToAdd) else {
            throw PropertyError.alreadyExists("Plant with name \(nameToAdd) already exists!")
        }
        
        household.plants.append(nameToAdd)
    }
    
    func removePlant(_ name: String) {
        do {
            try _removePlant(name)
        } catch let error as PropertyError {
            switch error {
            case .notFound(let msg):
                errorMessage = msg
                showError = true
            case .outOfRange(_), .alreadyExists(_):
                print("An unexpected error occurred: \(error)")
            }
        } catch {
            print("An unexpected error occurred: \(error)")
        }
    }
    
    private func _removePlant(_ name: String) throws {
        let nameToRemove = name.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard household.plants.contains(nameToRemove) else {
            throw PropertyError.notFound("Plant with name \(nameToRemove) wasn't found!")
        }
        
        household.plants.removeAll { $0 == name }
    }
}
