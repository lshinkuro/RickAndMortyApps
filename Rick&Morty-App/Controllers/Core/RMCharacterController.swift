//
//  RMCharacterControllers.swift
//  Rick&Morty-App
//
//  Created by nur kholis on 22/01/23.
//

import UIKit

class RMCharacterController: UIViewController {

  private let characterListView = CharacterListView()

    override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .systemBackground
      title = "Character"

      view.addSubview(characterListView)
      NSLayoutConstraint.activate([
        characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
        characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
      ])
      
    }
    


}
