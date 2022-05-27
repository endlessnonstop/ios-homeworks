//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 26.05.2022.
//

import UIKit

protocol PhotosTableViewCellDelegate: AnyObject{
    func jumpToPhotosViewController()
}

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

    weak var delegate: PhotosTableViewCellDelegate?

    //массив с названиями фотографий для коллекции
    let photosArray = Photos.makePhotosArray()

    //photosLabel
    let photosLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .boldSystemFont(ofSize: 24)
        $0.textColor = .black
        //$0.backgroundColor = .green
        $0.text = "Photos"
        return $0
    }(UILabel())

    //кнопка перехода к коллекции фотографий
    let photosButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        //$0.backgroundColor = .green
        $0.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        $0.addTarget(self, action: #selector(photosButtonTap), for: .touchUpInside)
        return $0
    }(UIButton())

    //collectionView для фотографий
    private lazy var photosCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false //работает ли с этим???????????????????????????
        collection.dataSource = self
        collection.delegate = self
        //collection.backgroundColor = .green
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier!) //регистрация ячейки
        return collection
    }()//(UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())) //без этого инициализатора вообще не работает!!!!!!!!!!!!!!!!!!!!!!

    //MARK: - functions

    //нажатие на кнопку перехода к коллекции фотографий
    @objc private func photosButtonTap() {
        print("Сработал photosButtonTap")
        delegate?.jumpToPhotosViewController()
    }

    private func addingElements() {
        contentView.addSubview(photosLabel)
        contentView.addSubview(photosButton)
        contentView.addSubview(photosCollectionView) //попробовать поменять порядок, если не заработает!!!!!!!!!!!!!!!!!!!!!!!!!!
    }

    //настройка ограничений
    private func setLayouts() {

        //let photosCollectionHeight = 0.25 * contentView.bounds.width - 0

        NSLayoutConstraint.activate([

            //contentView.heightAnchor.constraint(equalToConstant: (12 + 24 + 12 + (UIScreen.main.bounds.width - (12 * 2 + 8 * 3)) / 4) + 12),

            //photosLabel
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),


            //photosButton
            photosButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            photosButton.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),

            //photosCollection
            photosCollectionView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            photosCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photosCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            photosCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 12),
            photosCollectionView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - (12 * 2 + 8 * 3)) / 4)//,
            //photosCollectionView.heightAnchor.constraint(equalToConstant: photosCollectionHeight)

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
        return photosArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        print("Сработал cellForItemAt")

        let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier!, for: indexPath) as! PhotosCollectionViewCell
        let cellID = indexPath.item

        //настройка и возвращение ячейки коллекции
        photoCell.photoImageView.image = UIImage(named: photosArray[cellID].photoName)
        photoCell.photoImageView.layer.cornerRadius = 6
//        photoCell.setCell(style: 1)

        return photoCell
    }

}

//MARK: - UICollectionViewDelegateFlowLayout

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {

    private var sideInset: CGFloat {return 8}

    //настройка размеров одной ячейки

    //настройка размеров одной ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = (collectionView.bounds.width - sideInset * 3) / 4
        let width = collectionView.bounds.height


//        NSLayoutConstraint.activate([
//
//            photosCollectionView.heightAnchor.constraint(equalToConstant: width)
//
//        ])

        return CGSize(width: width, height: width)
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = (collectionView.bounds.width - sideInset * 4) / 5
//        return CGSize(width: width, height: width)
//    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        sideInset
//    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
//    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        print(indexPath.section, indexPath.item)
    }
}
