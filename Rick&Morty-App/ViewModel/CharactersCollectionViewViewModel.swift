//
//  CharactersCollectionViewViewModel.swift
//  Rick&Morty-App
//
//  Created by nur kholis on 28/01/23.
//

import Foundation



final class CharactersCollectionViewViewModel: NSObject {


  public let characterName: String
  private let characterStatus: RMCharacterStatus
  public let characterImage: URL?

  init(characterName: String, characterStatus: RMCharacterStatus, characterImage: URL?) {
    self.characterName = characterName
    self.characterStatus = characterStatus
    self.characterImage = characterImage
  }

  public var characterStatusName: String {
    return " Status :\(characterStatus.text)"
  }

  public func fetchImage(completion: @escaping(Result<Data, Error>) -> Void) {
    guard let url =  characterImage  else {
      completion(.failure(URLError(.badURL)))
      return
    }
    let request = URLRequest(url: url)
    let task = URLSession.shared.dataTask(with: request) { data, _, error in
      guard let data = data, error == nil else {
        completion(.failure(error ?? URLError(.badServerResponse)))
        return
      }
      completion(.success(data))
    }
   task.resume()
  }
  
}
