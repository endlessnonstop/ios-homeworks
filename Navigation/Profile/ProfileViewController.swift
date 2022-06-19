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
        $0.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier!)
        $0.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier!)
        $0.separatorInset = .zero
        $0.backgroundColor = .systemGray6
        return $0
    }(UITableView(frame: .zero, style: .grouped)) //хедер скроллится вместе с секцией
    
    //массив данных для постов
    private let postArray = Post.makePostArray()
    
    // MARK: - functions:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        addingElements()
        setLayouts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
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
            
        ])
    }
}

// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    
    //количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    //количество ячеек в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if section == 0 {
            //для секции с ProfileHeaderView и PhotosTableViewCell
            return 1
        } else {
            //для секции с постами
            return postArray.count
        }
    }
    
    //возвращает экземпляр ячейки, наполнение ячейки данными
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = indexPath.row

        //ячейка поста
        let cell = PostTableViewCell(style: .default, reuseIdentifier: String(cellID))

        //ячейка с коллекцией фото
        let photoCell = PhotosTableViewCell(style: .default, reuseIdentifier: nil)

        if indexPath.section == 0 {
            //настройка и возвращение ячейки с коллекцией фото
            photoCell.delegate = self
            return photoCell
        } else {
            //настройка и возвращение ячейки поста
            cell.authorLable.text = postArray[cellID].author
            cell.image.image = UIImage(named: postArray[cellID].image)
            cell.postDescription.text = postArray[cellID].description
            cell.likesCount = postArray[cellID].likes
            cell.likesCountLabel.text = String(postArray[cellID].likes)
            cell.viewsCount = postArray[cellID].views
            cell.viewsCountLabel.text = String(postArray[cellID].views)
            return cell
        }

    }

    //действия при выборе ячейки
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //если секция 0
        if indexPath.section == 0 {
            //реализация для секции 0
        } else {
            //реализация для секции 1
            let cell = tableView.cellForRow(at: indexPath) as! PostTableViewCell
            cell.viewsCount += 1
            cell.viewsCountLabel.text = String(cell.viewsCount)
            let extendedPostVC = ExtendedPostViewController()
            extendedPostVC.authorLable.text = cell.authorLable.text
            extendedPostVC.image.image = cell.image.image
            extendedPostVC.postDescription.text = cell.postDescription.text
            extendedPostVC.likesCountLabel.text = cell.likesCountLabel.text
            extendedPostVC.viewsCountLabel.text = cell.viewsCountLabel.text
            present(extendedPostVC, animated: true)
        }
    }
    
}

// MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //вью для Header секции
        if section == 0 {
            let profileHeader = ProfileHeaderView()
            return profileHeader
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return CGFloat(UITableView.automaticDimension)
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
}

// MARK: - PhotosTableViewCellDelegate

extension ProfileViewController: PhotosTableViewCellDelegate {
    func jumpToPhotosViewController() {
        let photosVC = PhotosViewController()
        navigationController?.pushViewController(photosVC, animated: true)
    }
}
