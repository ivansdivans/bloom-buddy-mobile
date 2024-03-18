//
//  HouseholdConfiguration.swift
//  BloomBuddyMobile
//
//  Created by Daan Brocatus on 13/03/2024.
//

import Foundation

struct HouseholdConfiguration: Equatable {
    var sunlight: SunlightLevel = .average
    var airQuality: Int = 0
    var humidity: Int = 0
    var averageTemperature: Int = 10
}
