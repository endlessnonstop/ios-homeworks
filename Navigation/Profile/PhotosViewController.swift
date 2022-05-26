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

        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collection.translatesAutoresizingMaskIntoConstraints = false //работает ли с этим???????????????????????????

        collection.backgroundColor = .green

        collection.dataSource = self
        collection.delegate = self
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier!) //регистрация ячейки
        return collection
    }()

    //MARK: - functions

    override func viewDidLoad() {
        super.viewDidLoad()
        addingElements()
        setLayouts()

        // Do any additional setup after loading the view.
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
        print("4 ячейки")
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        //print("Сработал cellForItemAt")

        let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier!, for: indexPath) as! PhotosCollectionViewCell

        return photoCell
    }

}

//MARK: - UICollectionViewDelegateFlowLayout

extension PhotosViewController: UICollectionViewDelegateFlowLayout {

}
