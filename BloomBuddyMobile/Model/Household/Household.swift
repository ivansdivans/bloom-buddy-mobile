//
//  Household.swift
//  BloomBuddyMobile
//
//  Created by Daan Brocatus on 13/03/2024.
//

import Foundation

struct Household {
    var name: String = "My household"
    var plants: [String] = ["Plant 1", "Plant 2", "Plant 3", "Plant 4", "Plant 5"]
    var configuration: HouseholdConfiguration = HouseholdConfiguration()
    var plantCount: String {
        return "\(plants.count)/5"
    }
}
