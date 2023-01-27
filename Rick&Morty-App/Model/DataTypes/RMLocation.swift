//
//  RMLocation.swift
//  Rick&Morty-App
//
//  Created by nur kholis on 22/01/23.
//

import Foundation



// MARK: - Welcome
struct RMLocation: Codable {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    let created: String
}

// MARK: - Location
struct RMOrigin: Codable {
    let name: String
    let url: String
}
