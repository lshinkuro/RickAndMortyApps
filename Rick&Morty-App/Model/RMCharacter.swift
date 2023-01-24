//
//  RMCharacter.swift
//  Rick&Morty-App
//
//  Created by nur kholis on 22/01/23.
//

import Foundation



// MARK: - RMCharacter
struct RMCharacter: Codable {
    let id: Int
  let status: RMCharacterStatus
    let name, species, type: String
    let gender: RMCharacterGender
    let origin: RMOrigin
    let location: RMSingleLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

enum RMCharacterStatus: String, Codable {
  case alive = "Alive"
  case dead = "Dead"
  case `unknown` = "unknown"
}

enum RMCharacterGender: String, Codable {
  case male = "Male"
  case female = "Female"
  case genderless = "Genderless"
  case `unknown` = "unknown"
}
