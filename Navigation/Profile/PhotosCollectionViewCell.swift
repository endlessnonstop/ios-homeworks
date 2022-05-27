//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 26.05.2022.
//

import UIKit

//ячейка для collectionView

class PhotosCollectionViewCell: UICollectionViewCell {

    //MARK: - override inits

    override init(frame: CGRect) {
        super.init(frame: frame)
        addingElements()
        setLayouts()
        setCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    //MARK: - parameters

    //изображение
    var photoImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "profileImage")
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())

    //MARK: - functions

    //добавление элементов
    private func addingElements() {
        contentView.addSubview(photoImageView)
    }

    //настройка ячейки
    func setCell() {
//        photoImageView.layer.cornerRadius = 10
//        contentView.layer.cornerRadius = 26
//        contentView.backgroundColor = .red
    }

    //настройка ограничений
    private func setLayouts() {
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
    }
}
