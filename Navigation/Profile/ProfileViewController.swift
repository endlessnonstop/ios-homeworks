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

        $0.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier!)  //???????????????????????????????
        $0.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier!) //???????????????????????????????

        $0.separatorInset = .zero
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
        //jumpToPhotosViewController()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

//    func heightForHeader() -> CGFloat {
//        var height: CGFloat
//        //height = profileHeader.bounds.height
//        height = profileHeader.layer.bounds.height
//        print(height)
//        return height
//        //return 218
//    }

//    override func viewWillAppear() {
//        super.viewWillAppear()
//        navigationController?.navigationBar.isHidden = true
//    }
    
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
            
            //tableView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
            
        ])
    }
}

// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {

    //
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    //количество ячеек в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return postArray.count
        }
    }
    
    //возвращает экземпляр ячейки, наполнение ячейки данными
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        //ячейка поста
        let cell = PostTableViewCell(style: .default, reuseIdentifier: nil)
        let cellID = indexPath.row

        let photoCell = PhotosTableViewCell(style: .default, reuseIdentifier: nil)

        if indexPath.section == 0 {
            //настройка и возвращение ячейки с коллекцией фото
            print("Сработало создание ячейки с фотографиями")
            photoCell.delegate = self
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
        //вью для Header секции
        if section == 0 {
            let profileHeader = ProfileHeaderView()
            return profileHeader
        } else {
            let separator: UIView = {
                $0.backgroundColor = .lightGray
                return $0
            }(UIView())
            return separator
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        //heightForHeader()
        if section == 0 {
            return 218
        } else {
            return 12
        }
        //UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    
}

// MARK: - PhotosTableViewCellDelegate

extension ProfileViewController: PhotosTableViewCellDelegate {

    func jumpToPhotosViewController() {
        print("Сработал jumpToPhotosViewController")
        let photosVC = PhotosViewController()
        navigationController?.pushViewController(photosVC, animated: true)
    }
}
