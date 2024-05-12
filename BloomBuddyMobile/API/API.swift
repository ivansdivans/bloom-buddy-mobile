//
//  API.swift
//  BloomBuddyMobile
//
//  Created by Daan Brocatus on 25/04/2024.
//

import Foundation

protocol API {
    func getPlantByName(_ name: String) throws -> Plant
}
