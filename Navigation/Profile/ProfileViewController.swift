//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 18.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - parameters:
    
    //tableView
    private lazy var tableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.dataSource = self
        $0.delegate = self
        //$0.frame = .zero
        //$0.style = .grouped
        //$0.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier!)
        //$0.tableHeaderView?.backgroundColor = .white
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
            
            tableView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor)
            
        ])
    }
}

// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    
    //количество ячеек в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    //возвращает экземпляр ячейки, наполнение ячейки данными
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PostTableViewCell(style: .default, reuseIdentifier: nil)
        cell.authorLable.text = postArray[indexPath.row].author
        cell.image.image = UIImage(named: postArray[indexPath.row].image)
        cell.postDescription.text = postArray[indexPath.row].description
        cell.likesCount.text = String(postArray[indexPath.row].likes)
        cell.viewsCount.text = String(postArray[indexPath.row].views)
        return cell //можно было сделать то же самое в функции самого класса ячейки, передав в неё indexPath.row
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

//MARK: - extension UIView

extension UIView {
    static var identifier: String? {
        return String(describing: self)
    }
}
