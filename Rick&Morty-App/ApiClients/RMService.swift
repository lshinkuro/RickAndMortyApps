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

  enum RMServiceError: Error {
    case failedToCreateRequest
    case failedToGetData
  }

  /// Send Rick and Morty API Call
  /// - Parameters:
  ///   - request: request instances
  ///   - completion: completion with data or error
  public func execute<T: Codable>(_ request: RMRequest,
                                  expecting type: T.Type,
                                  completion: @escaping(Result<T, Error>) -> Void) {

    guard let urlRequest = self.request(from: request)  else {
      completion(.failure(RMServiceError.failedToCreateRequest))
      return
    }

    let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
      guard let data = data, error == nil else {
        completion(.failure(RMServiceError.failedToGetData))
        return
      }

      do {
        let result = try JSONDecoder().decode(type.self , from: data)
        completion(.success(result))
      } catch {
        completion(.failure(error))
      }
    }

    task.resume()


  }


  public func request(from rmRequest: RMRequest) -> URLRequest? {
    guard let url = rmRequest.url else { return nil }
    var request = URLRequest(url: url)
    request.httpMethod =  rmRequest.httpMethod
    return request
  }
}
