//
//  RMRequest.swift
//  Rick&Morty-App
//
//  Created by nur kholis on 22/01/23.
//

import Foundation


final class RMRequest {

  private struct Constants {
    static let baseURL = "https://www.rickandmortyapi.com/api"
  }

  private let endpoint: RMEndpoint
  private let pathComponent: Set<String>
  private let queryParameters: [URLQueryItem]
  
  init(endpoint: RMEndpoint, pathComponent: Set<String> = [], queryParameters: [URLQueryItem] = []) {
    self.endpoint = endpoint
    self.pathComponent = pathComponent
    self.queryParameters = queryParameters
  }

  private var urlString: String {
    var string = Constants.baseURL

    string += "/"
    string += endpoint.rawValue

    if !pathComponent.isEmpty {
      pathComponent.forEach{
        string += "/"
        string += "\($0)"
      }
    }

    if !queryParameters.isEmpty {
      string += "?"
      let argsString = queryParameters.compactMap{
        guard let value = $0.value else {
          return nil
        }
        return "\($0.name)=\(value)"
      }.joined(separator: "&")

      string += argsString
    }
    
    return string
  }

  public var url : URL? {
    return URL(string: urlString)
  }

  public let httpMethod = "GET"
  
}
