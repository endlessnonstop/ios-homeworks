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
        setCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//MARK: - functions

    private func setCell() {
        contentView.backgroundColor = .red
        contentView.layer.cornerRadius = 6
    }
}
