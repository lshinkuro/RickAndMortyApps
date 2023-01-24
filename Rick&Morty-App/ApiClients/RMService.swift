//
//  RMService.swift
//  Rick&Morty-App
//
//  Created by nur kholis on 22/01/23.
//

import Foundation


/// Primary api service to get object
final class RMService {

  /// shared singleton instance
   static let shared = RMService()

  private init() {}


  /// Send Rick and Morty API Call
  /// - Parameters:
  ///   - request: request instances
  ///   - completion: completion with data or error
  public func execute<T: Codable>(_ request: RMRequest,
                                  expecting type: T.Type,
                                  completion: @escaping(Result<T, Error>) -> Void) {

  }
  
}
