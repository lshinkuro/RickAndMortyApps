//
//  CaharacterCollectionViewCell.swift
//  Rick&Morty-App
//
//  Created by nur kholis on 28/01/23.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    static let identifier = "CaharacterCollectionViewCell"

  private let imageView: UIImageView = {
    let image = UIImageView()
    image.contentMode = .scaleAspectFill
    image.clipsToBounds = true
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()

  private let nameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .label
    label.font = .systemFont(ofSize: 18, weight: .medium)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let statusLabel: UILabel = {
    let label = UILabel()
    label.textColor = .secondaryLabel
    label.font = .systemFont(ofSize: 16, weight: .regular)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.backgroundColor = .secondarySystemBackground
    contentView.addSubviews(imageView, nameLabel, statusLabel)
    setupLayer()
    addConstraint()
  }

  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    super.traitCollectionDidChange(previousTraitCollection)
    setupLayer()
  }

  func setupLayer() {
    contentView.layer.cornerRadius = 10
    contentView.layer.shadowColor = UIColor.secondaryLabel.cgColor
    contentView.layer.shadowOffset = CGSize(width: -4, height: 4)
    contentView.layer.shadowOpacity = 0.4
  }


  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    self.imageView.image = nil
    self.nameLabel.text = nil
    self.statusLabel.text = nil
  }

  func addConstraint() {

    NSLayoutConstraint.activate([

      statusLabel.heightAnchor.constraint(equalToConstant: 40),
      nameLabel.heightAnchor.constraint(equalToConstant: 40),

      statusLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7),
      statusLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -7),
      nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7),
      nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -7),

      statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
      nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -3),

      imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
      imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
      imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -3),


    ])
  }

  func configure(viewModel: CharactersCollectionViewViewModel) {
    nameLabel.text =  viewModel.characterName
    statusLabel.text =  viewModel.characterStatusName

    viewModel.fetchImage { [weak self] result in

      switch result {
      case .success(let data):
        DispatchQueue.main.async {
          let image = UIImage(data: data)
          self?.imageView.image = image
        }
      case .failure(let error):
        print(String(describing: error))
        break
      }

    }

  }
}
