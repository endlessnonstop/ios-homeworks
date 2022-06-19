//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 26.05.2022.
//

import UIKit

protocol PhotosTableViewCellDelegate: AnyObject {
    func jumpToPhotosViewController()
}

//ячейка с коллекцией фото для таблицы
class PhotosTableViewCell: UITableViewCell {
    
    //MARK: - override inits
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
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
        $0.text = "Photos"
        return $0
    }(UILabel())
    
    //кнопка перехода к коллекции фотографий
    let photosButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        $0.addTarget(self, action: #selector(photosButtonTap), for: .touchUpInside)
        return $0
    }(UIButton())
    
    //collectionView для фотографий
    private lazy var photosCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier!) //регистрация ячейки
        return collection
    }()
    
    //MARK: - functions
    
    //нажатие на кнопку перехода к коллекции фотографий
    @objc private func photosButtonTap() {
        delegate?.jumpToPhotosViewController()
    }
    
    private func addingElements() {
        contentView.addSubview(photosLabel)
        contentView.addSubview(photosButton)
        contentView.addSubview(photosCollectionView)
    }
    
    //настройка ограничений
    private func setLayouts() {
        
        NSLayoutConstraint.activate([
            
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
            photosCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            photosCollectionView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - (12 * 2 + 8 * 3)) / 4)//,
            
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

        let photoCell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier!, for: indexPath) as! PhotosCollectionViewCell
        let cellID = indexPath.item
        
        //настройка и возвращение ячейки коллекции
        photoCell.photoImageView.image = UIImage(named: photosArray[cellID].photoName)
        photoCell.photoImageView.layer.cornerRadius = 6
        
        return photoCell
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    
    private var sideInset: CGFloat {return 8}
    
    //настройка размеров одной ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.height
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }

    //действия при нажатии на ячейку
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        //реализация
    }
}
