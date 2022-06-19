//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 26.05.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    //MARK: - parameters
    
    //photosCollectionView
    private lazy var photosCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        collection.dataSource = self
        collection.delegate = self
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier!) //регистрация ячейки
        return collection
    }()
    
    //массив с названиями фотографий для коллекции
    private let photosArray = Photos.makePhotosArray()

    //увеличенное фото
    private lazy var photoImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.alpha = 0.0
        $0.clipsToBounds = true
        $0.isUserInteractionEnabled = false
        $0.image = nil
        return $0
    }(UIImageView())

    //полупрозрачная вью под увеличенное изображение профиля
    private lazy var transparencyView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isUserInteractionEnabled = false
        $0.alpha = 0.0
        $0.backgroundColor = .black
        $0.frame = UIScreen.main.bounds
        return $0
    }(UIView())

    //кнопка закрытия увеличенного изображения профиля
    private lazy var closeButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.alpha = 0.0
        $0.isUserInteractionEnabled = false
        $0.setImage(UIImage(systemName: "xmark.circle",
                            withConfiguration: UIImage.SymbolConfiguration(pointSize: 50))?.withTintColor(.white, renderingMode: .alwaysOriginal),
                            for: .normal)
        $0.addTarget(self, action: #selector(closeButtonTap), for: .touchUpInside)
        return $0
    }(UIButton())
    
    //MARK: - functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photos"
        navigationController?.navigationBar.backgroundColor = .white
        addingElements()
        setLayouts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    //действия при нажатии на кнопку закрытия
    @objc private func closeButtonTap() {
        closeButton.isUserInteractionEnabled = false
        transparencyView.isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.3) {
            self.closeButton.alpha = 0.0
            self.photoImage.alpha = 0.0
            self.transparencyView.alpha = 0.0
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.navigationController?.navigationBar.alpha = 1.0
                self.tabBarController?.tabBar.alpha = 1.0
            }
        }
    }
    
    //добавление элементов
    private func addingElements() {
        view.addSubview(photosCollectionView)
        view.addSubview(transparencyView)
        view.addSubview(photoImage)
        view.addSubview(closeButton)
    }
    
    //настройка ограничений
    private func setLayouts() {
        NSLayoutConstraint.activate([
            
            //photosCollectionView
            photosCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photosCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            photosCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            photosCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            //photoImage
            photoImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            photoImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            photoImage.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            photoImage.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),

            //closeButton
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
            
        ])
    }
    
}

//MARK: - UICollectionViewDataSource

extension PhotosViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier!, for: indexPath) as! PhotosCollectionViewCell
        let cellID = indexPath.item
        //настройка и возвращение ячейки коллекции
        photoCell.photoImageView.image = UIImage(named: photosArray[cellID].photoName)
        photoCell.delegate = self
        return photoCell
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        //реализация при выделении ячейки
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    private var sideInset: CGFloat { return 8 }
    
    //размер для ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - sideInset * 4) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sideInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sideInset
    }
}


extension PhotosViewController: PhotosCollectionViewCellDelegate {
    //показ увеличенной фотографии из коллекции
    func showBigPhoto(photo: UIImage) {
        photoImage.image = photo
        transparencyView.isUserInteractionEnabled = true
        UIView.animate(withDuration: 0.1) {
            self.navigationController?.navigationBar.alpha = 0.01
            self.tabBarController?.tabBar.alpha = 0.01
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.transparencyView.alpha = 0.4
                self.photoImage.alpha = 1.0
                self.closeButton.alpha = 1.0
            }
        }
        closeButton.isUserInteractionEnabled = true
    }
}
