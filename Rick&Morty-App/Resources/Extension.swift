//
//  Extension.swift
//  Rick&Morty-App
//
//  Created by nur kholis on 28/01/23.
//

import Foundation
import UIKit

extension UIView {
  func addSubviews(_ views: UIView...) {
    views.forEach {
      self.addSubview($0)
    }
  }
}
