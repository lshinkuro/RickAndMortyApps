//
//  CharacterListView.swift
//  Rick&Morty-App
//
//  Created by nur kholis on 27/01/23.
//

import UIKit

class CharacterListView: UIView {

  private let viewModel = CharactersListViewViewModel()

  private let spinner: UIActivityIndicatorView = {
    let spinner = UIActivityIndicatorView(style: .large)
    spinner.hidesWhenStopped = true
    spinner.translatesAutoresizingMaskIntoConstraints = false
    return spinner
  }()

  private let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical

    layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collection.isHidden = true
    collection.alpha = 0
    collection.showsVerticalScrollIndicator = false
    collection.translatesAutoresizingMaskIntoConstraints = false
    collection.register(CharacterCollectionViewCell.self,
                        forCellWithReuseIdentifier: CharacterCollectionViewCell.identifier)
    return collection
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    addSubviews(collectionView, spinner)
    addConstraint()
    spinner.startAnimating()
    viewModel.delegate = self
    viewModel.fetchCharacter()
    setupCollection()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func addConstraint() {
    NSLayoutConstraint.activate([
      spinner.widthAnchor.constraint(equalToConstant: 100),
      spinner.heightAnchor.constraint(equalToConstant: 100),
      spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
      spinner.centerYAnchor.constraint(equalTo: centerYAnchor),

      collectionView.topAnchor.constraint(equalTo: topAnchor),
      collectionView.leftAnchor.constraint(equalTo: leftAnchor),
      collectionView.rightAnchor.constraint(equalTo: rightAnchor),
      collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)

    ])
  }

   private func setupCollection() {
    collectionView.dataSource = viewModel
    collectionView.delegate = viewModel
  }

}

extension CharacterListView: CharactersListViewViewModelDelegate {
  func didLoadInitialCharacters() {
    spinner.stopAnimating()
    collectionView.isHidden = false
    collectionView.reloadData()
    UIView.animate(withDuration: 0.4) {
      self.collectionView.alpha = 1
    }
  }
}
