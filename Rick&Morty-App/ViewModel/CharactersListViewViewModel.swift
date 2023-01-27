//
//  CharactersListViewViewModel.swift
//  Rick&Morty-App
//
//  Created by nur kholis on 27/01/23.
//

import UIKit
import Foundation

protocol CharactersListViewViewModelDelegate: AnyObject {
  func didLoadInitialCharacters()
}

final class CharactersListViewViewModel: NSObject {

  public weak var delegate: CharactersListViewViewModelDelegate?

  var characters: [RMCharacter] = [] {
    didSet {
      for character in characters {
        let viewModel = CharactersCollectionViewViewModel(
          characterName: character.name,
          characterStatus: character.status,
          characterImage: URL(string: character.image))
        cellViewModels.append(viewModel)
      }
    }
  }

  private var cellViewModels: [CharactersCollectionViewViewModel] = []

  func fetchCharacter() {
    RMService.shared.execute(.listCharacterRequest, expecting: RMGetAllCharatersResponse.self) { result in
      switch result {
      case .success(let model):
        let results = model.results
        self.characters = results
        DispatchQueue.main.async {
          self.delegate?.didLoadInitialCharacters()
        }
        print("example image "+String(describing: model.results.first?.image))

      case .failure(let error):
        print(String(describing: error))
      }
    }
  }
}

extension CharactersListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return cellViewModels.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.identifier, for: indexPath) as? CharacterCollectionViewCell
    else {
      fatalError("unsupported cell")
    }
    let viewModel = cellViewModels[indexPath.row]
    cell.configure(viewModel: viewModel)
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let bounds = UIScreen.main.bounds
    let width = (bounds.width-30)/2

    return CGSize(
      width: width,
      height: width * 1.5 )
  }


}

