//
//  PropertyError.swift
//  BloomBuddyMobile
//
//  Created by Daan Brocatus on 14/03/2024.
//

import Foundation

enum PropertyError: Error {
    case notFound(String)
    case outOfRange(String)
    case alreadyExists(String)
}
