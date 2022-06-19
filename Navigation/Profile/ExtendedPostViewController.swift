//
//  ExtendedPostViewController.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 13.06.2022.
//

import UIKit

class ExtendedPostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addingElements()
        setLayouts()
    }

    //MARK: - parameters

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

    //надпись просмотров
    let viewsLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .black
        $0.text = "views: "
        return $0
    }(UILabel())

    //количество просмотров
    let viewsCountLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .black
        $0.text = "0"
        return $0
    }(UILabel())

    //MARK: - functions

    //добавление элементов
    private func addingElements() {
        [authorLable, image, postDescription, likesLabel, likesCountLabel, viewsCountLabel, viewsLabel].forEach { view.addSubview($0) }
    }

    //настройка ограничений
    private func setLayouts() {

        NSLayoutConstraint.activate([

            //authorLable
            authorLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            authorLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            authorLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            //image
            image.topAnchor.constraint(equalTo: authorLable.bottomAnchor, constant: 12),
            image.widthAnchor.constraint(equalTo: view.widthAnchor),
            image.heightAnchor.constraint(equalTo: view.widthAnchor),

            //postDescription
            postDescription.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
            postDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            postDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            postDescription.heightAnchor.constraint(equalToConstant: 50),

            //likesLabel
            likesLabel.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            //likesCount
            likesCountLabel.leadingAnchor.constraint(equalTo: likesLabel.trailingAnchor),
            likesCountLabel.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),

            //viewsCountLabel
            viewsCountLabel.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            viewsCountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            //viewsLabel
            viewsLabel.trailingAnchor.constraint(equalTo: viewsCountLabel.leadingAnchor),
            viewsLabel.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),

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
