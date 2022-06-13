//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 25.05.2022.
//

import UIKit

//ячейка для таблицы/ленты постов

class PostTableViewCell: UITableViewCell {
    
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

    //признак, был ли лайкнут пост
    var isLiked: Bool = false

    //количество лайков
    var likesCount: Int = 0
    
    //автор поста
    let authorLable: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textColor = .black
        $0.text = "author"
        $0.numberOfLines = 2
        return $0
    }(UILabel())
    
    //изображение
    let image: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        $0.backgroundColor = .black
        return $0
    }(UIImageView())
    
    //текст публикации
    let postDescription: UITextView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = .systemGray
        $0.textAlignment = .left
        $0.contentMode = .scaleAspectFit
        return $0
    }(UITextView())
    
    //надпись лайков
    lazy var likesLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .black
        $0.text = "likes: "
        $0.isUserInteractionEnabled = true
        //$0.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(likeTap))
        $0.addGestureRecognizer(tapGesture)
        return $0
    }(UILabel())
    
    //количество лайков
    let likesCountLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .black
        $0.text = "0"
        return $0
    }(UILabel())
    
    //количество просмотров
    let viewsCount: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .black
        $0.text = "0"
        return $0
    }(UILabel())
    
    //надпись просмотров
    let viewsLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .black
        $0.text = "views: "
        return $0
    }(UILabel())
    
    //MARK: - functions

    //
    @objc private func likeTap() {
        print(#function)

        //что будет, если количество лайков 0?
        if self.isLiked == false {
            likesCount += 1
            likesCountLabel.text = String(likesCount)
            //var count = Int(likesCountLabel.text ?? "-1")!
            //count += 1
            //likesCountLabel.text = String(count)
            isLiked = true
        } else {
//            var count = Int(likesCountLabel.text ?? "-1")!
//            count -= 1
//            likesCountLabel.text = String(count)
            likesCount -= 1
            likesCountLabel.text = String(likesCount)
            isLiked = false
        }
    }
    
    //добавление элементов
    private func addingElements() {
        
        [authorLable, image, postDescription, likesLabel, likesCountLabel, viewsCount, viewsLabel].forEach { contentView.addSubview($0) }
    }
    
    //настройка ограничений
    private func setLayouts() {
        
        NSLayoutConstraint.activate([
            
            //authorLable
            authorLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorLable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorLable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            //image
            image.topAnchor.constraint(equalTo: authorLable.bottomAnchor, constant: 12),
            image.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            image.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            
            //postDescription
            postDescription.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
            postDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            //postDescription.bottomAnchor.constraint(equalTo: likesLabel.topAnchor, constant: -16),
            postDescription.heightAnchor.constraint(equalToConstant: 50),
            
            //likesLabel
            likesLabel.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            //likesCount
            likesCountLabel.leadingAnchor.constraint(equalTo: likesLabel.trailingAnchor),
            likesCountLabel.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            
            //viewsCount
            viewsCount.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            viewsCount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsCount.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            //viewsLabel
            viewsLabel.trailingAnchor.constraint(equalTo: viewsCount.leadingAnchor),
            viewsLabel.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
            
        ])
        
    }
    
}
