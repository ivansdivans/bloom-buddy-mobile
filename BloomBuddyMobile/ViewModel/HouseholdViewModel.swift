//
//  HouseholdViewModel.swift
//  BloomBuddyMobile
//
//  Created by Daan Brocatus on 13/03/2024.
//

import Foundation
import SwiftData
import UIKit

class HouseholdViewModel: ObservableObject {
    private let mlModel: BloomBuddyML
    private let api: API
    
    @Published var household: Household = Household()
    @Published var showError = false
    @Published var errorMessage = ""
    @Published var isConfiguring = false
    @Published var isAdding = false
    @Published var newPlant: Plant!
    @Published var selectedImage: UIImage? {
        didSet {
            guard let image = selectedImage else { return }
            mlModel.classifyImage(image) { predictions in
                do {
                    let plant = try self.api.getPlantByName(predictions!.first!.label)
                    self.newPlant = plant
                    self.isAdding = true
                    self.selectedImage = nil
                } catch {
                    print(error)
                }
            }
        }
    }
    
    init(mlModel: BloomBuddyML = BloomBuddyML.shared, api: API = LocalJSONAPI()) {
        self.mlModel = mlModel
        self.api = api
        
        if (!UserDefaults.standard.bool(forKey: Constants.FirstTimeVisit.doneKey)) {
            self.isConfiguring = true
            UserDefaults.standard.setValue(true, forKey: Constants.FirstTimeVisit.doneKey)
        }
    }
    
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
            default:
                print("An unexpected error occurred: \(error)")
            }
        } catch {
            print("An unexpected error occurred: \(error)")
        }
    }
    
    func _changeName(_ name: String) throws {
        let newName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard (4...32).contains(newName.count) else {
            throw PropertyError.outOfRange("Your household name needs to be between 4 and 32 characters!")
        }
        
        household.name = newName
    }
    
    func addPlant() {
        do {
            try _addPlant(newPlant)
        } catch let error as PropertyError {
            switch error {
            case .outOfRange(let msg), .alreadyExists(let msg):
                errorMessage = msg
                showError = true
            default:
                print("An unexpected error occurred: \(error)")
            }
        } catch {
            print("An unexpected error occurred: \(error)")
        }
    }
    
    private func _addPlant(_ plant: Plant) throws {
        var plantToAdd = plant
        plantToAdd.nickName = plant.nickName.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard household.plants.count < 5 else {
            throw PropertyError.outOfRange("You can only have up to 5 plants!")
        }
        
        guard (4...32).contains(plantToAdd.nickName.count) else {
            throw PropertyError.outOfRange("Your plant nickname needs to be between 4 and 32 characters!")
        }
        
        guard !household.plants.contains(where: { $0.nickName == plantToAdd.nickName }) else {
            throw PropertyError.alreadyExists("Plant with nickname \(plantToAdd.nickName) already exists!")
        }
        
        household.plants.append(plantToAdd)
    }
    
    func removePlant(_ name: String) {
        do {
            try _removePlant(name)
        } catch let error as PropertyError {
            switch error {
            case .notFound(let msg):
                errorMessage = msg
                showError = true
            default:
                print("An unexpected error occurred: \(error)")
            }
        } catch {
            print("An unexpected error occurred: \(error)")
        }
    }
    
    private func _removePlant(_ name: String) throws {
        let nameToRemove = name.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard household.plants.contains(where: { $0.nickName == nameToRemove }) else {
            throw PropertyError.notFound("Plant with nickname \(nameToRemove) wasn't found!")
        }
        
        household.plants.removeAll { $0.nickName == nameToRemove }
    }
}
