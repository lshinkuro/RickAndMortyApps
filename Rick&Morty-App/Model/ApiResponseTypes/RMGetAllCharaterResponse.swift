//
//  RMGetAllCharaterResponse.swift
//  Rick&Morty-App
//
//  Created by nur kholis on 27/01/23.
//

import Foundation

// MARK: - RMGetAllCharatersResponse 
struct RMGetAllCharatersResponse: Codable {
    let info: Info
    let results: [RMCharacter]
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int
    let next: String
    let prev: String?
}

