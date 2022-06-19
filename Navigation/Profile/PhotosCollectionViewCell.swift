//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 26.05.2022.
//

import UIKit

protocol PhotosCollectionViewCellDelegate: AnyObject {
    func showBigPhoto(photo: UIImage)
}

//ячейка для collectionView
class PhotosCollectionViewCell: UICollectionViewCell {
    
    //MARK: - override inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addingElements()
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - parameters

    //делегат для передачи изображения в PhotosViewController
    weak var delegate: PhotosCollectionViewCellDelegate?
    
    //изображение
    //без lazy нажатия не обрабатываются!
    lazy var photoImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnPhotoImageView))
        $0.addGestureRecognizer(tapGesture)
        $0.isUserInteractionEnabled = true
        return $0
    }(UIImageView())
    
    //MARK: - functions

    //действия при нажатии на фото
    @objc private func tapOnPhotoImageView() {
        if photoImageView.image != nil {
            delegate?.showBigPhoto(photo: photoImageView.image!)
        }
    }
    
    //добавление элементов
    private func addingElements() {
        contentView.addSubview(photoImageView)
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
