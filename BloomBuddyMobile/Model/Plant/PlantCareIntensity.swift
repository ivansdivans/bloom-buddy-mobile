//
//  PlantCareIntensity.swift
//  BloomBuddyMobile
//
//  Created by Daan Brocatus on 29/04/2024.
//

import Foundation

enum PlantCareIntensity: String, CaseIterable {
    case veryEasy
    case easy
    case medium
    case hard
    case veryHard
    
    var displayText: String {
        switch self {
        case .veryEasy:
            return "Very easy"
        case .easy:
            return "Easy"
        case .medium:
            return "Medium"
        case .hard:
            return "Hard"
        case .veryHard:
            return "Very hard"
        }
    }
    
    init?(intValue: Int) {
        switch intValue {
        case 0:
            self = .veryEasy
        case 1:
            self = .easy
        case 2:
            self = .medium
        case 3:
            self = .hard
        case 4:
            self = .veryHard
        default:
            return nil
        }
    }
}
