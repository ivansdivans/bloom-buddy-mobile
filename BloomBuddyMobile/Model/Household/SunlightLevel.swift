//
//  SunlightLevel.swift
//  BloomBuddyMobile
//
//  Created by Daan Brocatus on 13/03/2024.
//

import Foundation

enum SunlightLevel: String, CaseIterable {
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
}
