//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 26.05.2022.
//

import UIKit

//ячейка с коллекцией фото для таблицы

class PhotosTableViewCell: UITableViewCell {

    //MARK: - override inits

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addingElements()
        setLayouts()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - parameters

    //photosLabel
    let photosLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .boldSystemFont(ofSize: 24)
        $0.textColor = .black
        $0.text = "Photos"
        return $0
    }(UILabel())

    //layout для photosCollection
//    let layout: UICollectionViewLayout = {
//        return $0
//    }(UICollectionViewLayout())

    //collectionView для фотографий
    private lazy var photosCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collection.translatesAutoresizingMaskIntoConstraints = false //работает ли с этим???????????????????????????

        collection.backgroundColor = .green

        collection.dataSource = self
        collection.delegate = self
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier!) //регистрация ячейки
        return collection
    }()//(UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())) //без этого инициализатора вообще не работает!!!!!!!!!!!!!!!!!!!!!!

    //MARK: - functions

    private func addingElements() {
        contentView.addSubview(photosLabel)
        contentView.addSubview(photosCollectionView)
    }

    //настройка ограничений
    private func setLayouts() {

        NSLayoutConstraint.activate([

            //photosLabel
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photosLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            //photosCollection
            photosCollectionView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            photosCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photosCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 12),
            photosCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 12)

        ])}

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//MARK: - UICollectionViewDataSource

extension PhotosTableViewCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("4 ячейки")
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        print("Сработал cellForItemAt")

        let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier!, for: indexPath) as! PhotosCollectionViewCell

        return photoCell
    }

}

//MARK: - UICollectionViewDelegateFlowLayout

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {

}
