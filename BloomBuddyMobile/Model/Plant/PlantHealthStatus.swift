//
//  PlantHealthStatus.swift
//  BloomBuddyMobile
//
//  Created by Daan Brocatus on 29/04/2024.
//

import Foundation

enum PlantHealthStatus: String, CaseIterable {
    case veryBad
    case bad
    case okay
    case good
    case veryGood
    
    var displayText: String {
        switch self {
        case .veryBad:
            return "Very bad"
        case .bad:
            return "Bad"
        case .okay:
            return "Okay"
        case .good:
            return "Good"
        case .veryGood:
            return "Very good"
        }
    }
}
