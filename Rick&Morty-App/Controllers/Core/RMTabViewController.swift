//
//  ViewController.swift
//  Rick&Morty-App
//
//  Created by nur kholis on 22/01/23.
//

import UIKit

class RMTabViewController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()
    setupTabs()
  }

  func setupTabs() {
    let location =  RMLocationController()
    let episode =  RMEpisodeController()
    let setting =  RMSettingController()
    let character =  RMCharacterController()

    let nav1 = UINavigationController(rootViewController: character)
    let nav2 = UINavigationController(rootViewController: location)
    let nav3 = UINavigationController(rootViewController: setting)
    let nav4 = UINavigationController(rootViewController: episode)

    nav1.tabBarItem = UITabBarItem(title: "Character",
                                   image: UIImage(systemName: "person"),
                                   tag: 1)
    nav2.tabBarItem = UITabBarItem(title: "Location",
                                   image: UIImage(systemName: "globe"),
                                   tag: 2)
    nav3.tabBarItem = UITabBarItem(title: "Setting",
                                   image: UIImage(systemName: "gear"),
                                   tag: 3)
    nav4.tabBarItem = UITabBarItem(title: "Episode",
                                   image: UIImage(systemName: "tv"),
                                   tag: 4)

    for nav in [nav1, nav2, nav3, nav4 ] {
      nav.navigationBar.prefersLargeTitles = true
    }

    setViewControllers( [nav1, nav2, nav3, nav4 ], animated: true)



  }


}

