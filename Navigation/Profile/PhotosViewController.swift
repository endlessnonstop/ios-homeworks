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
    let photosArray = Photos.makePhotosArray()

    //MARK: - functions

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photos"
        navigationController?.navigationBar.backgroundColor = .white
        addingElements()
        setLayouts()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    //добавление элементов
    private func addingElements() {
        view.addSubview(photosCollectionView)
    }

    //настройка ограничений
    private func setLayouts() {
        NSLayoutConstraint.activate([

            //photosCollectionView
            photosCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photosCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            photosCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            photosCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)

        ])
    }
    

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

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
        return photoCell //можно было сделать то же самое в функции самого класса ячейки, передав в неё indexPath.item
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
