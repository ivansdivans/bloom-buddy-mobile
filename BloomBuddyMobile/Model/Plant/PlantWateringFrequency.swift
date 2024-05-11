//
//  PlantWateringFrequency.swift
//  BloomBuddyMobile
//
//  Created by Daan Brocatus on 29/04/2024.
//

import Foundation

enum PlantWateringFrequency: String, CaseIterable {
    case veryLittle
    case little
    case average
    case aboveAverage
    case aLot
    
    var displayText: String {
        switch self {
        case .veryLittle:
            return "Very little"
        case .little:
            return "Little"
        case .average:
            return "Average"
        case .aboveAverage:
            return "Above average"
        case .aLot:
            return "A lot"
        }
    }
    
    init?(intValue: Int) {
        switch intValue {
        case 0:
            self = .veryLittle
        case 1:
            self = .little
        case 2:
            self = .average
        case 3:
            self = .aboveAverage
        case 4:
            self = .aLot
        default:
            return nil
        }
    }
}
