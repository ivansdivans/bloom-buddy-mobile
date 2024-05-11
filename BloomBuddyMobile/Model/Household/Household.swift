//
//  Household.swift
//  BloomBuddyMobile
//
//  Created by Daan Brocatus on 13/03/2024.
//

import Foundation

struct Household {
    var name: String = "My household"
    var plants: [Plant] = []
    var configuration: HouseholdConfiguration = HouseholdConfiguration()
    var plantCount: String {
        return "\(plants.count)/5"
    }
}
