//
//  RMCharacterControllers.swift
//  Rick&Morty-App
//
//  Created by nur kholis on 22/01/23.
//

import UIKit

class RMCharacterController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      view.backgroundColor = .systemBackground
      title = "Character"

      let requeest = RMRequest(
        endpoint: .character,
        pathComponent: ["1"],
        queryParameters: [
              URLQueryItem(name: "name", value: "rick"),
              URLQueryItem(name: "status", value: "alive")
                    ])

      print(requeest.url)

    }
    


}
