//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 18.05.2022.
//

import UIKit

//страница пользователя

class ProfileViewController: UIViewController {
    
    // MARK: - parameters:
    
    //tableView
    private lazy var tableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.dataSource = self
        $0.delegate = self
        $0.separatorInset = .zero
        return $0
    }(UITableView(frame: .zero, style: .grouped)) //хедер скроллится вместе с секцией
    
    //массив данных для постов
    private let postArray = Post.makePostArray()
    
    //вью для Header секции
    let profileHeader = ProfileHeaderView()
    
    // MARK: - functions:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addingElements()
        setLayouts()
        //navigationController?.navigationBar.isHidden = true
    }
    
    //добавление элементов
    private func addingElements() {
        view.addSubview(tableView)
    }
    
    //настройка ограничений
    private func setLayouts() {
        NSLayoutConstraint.activate([
            
            //tableView
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            tableView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
            
        ])
    }
}

// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    
    //количество ячеек в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count + 1
    }
    
    //возвращает экземпляр ячейки, наполнение ячейки данными
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        //ячейка поста
        let cell = PostTableViewCell(style: .default, reuseIdentifier: nil)
        let cellID = indexPath.row - 1

        let photoCell = PhotosTableViewCell(style: .default, reuseIdentifier: nil)

        if indexPath.row == 0 {
            //настройка и возвращение ячейки с коллекцией фото
            return photoCell
        } else {
            //настройка и возвращение ячейки поста
            cell.authorLable.text = postArray[cellID].author
            cell.image.image = UIImage(named: postArray[cellID].image)
            cell.postDescription.text = postArray[cellID].description
            cell.likesCount.text = String(postArray[cellID].likes)
            cell.viewsCount.text = String(postArray[cellID].views)
            return cell //можно было сделать то же самое в функции самого класса ячейки, передав в неё indexPath.row
        }
    }
    
}

// MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ProfileHeaderView()
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        218
    }
    
}

//MARK: - UICollectionViewDataSource

extension ProfileViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }

}

//MARK: - UICollectionViewDelegateFlowLayout

extension ProfileViewController: UICollectionViewDelegateFlowLayout {

}
