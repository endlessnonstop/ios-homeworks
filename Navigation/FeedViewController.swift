//
//  FeedViewController.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 18.05.2022.
//

import UIKit

class FeedViewController: UIViewController {

    //экземпляр структуры Post
    let post = Post(title: "Заголовок поста")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        self.title = "User feed"
        createButton()
        // Do any additional setup after loading the view.
        print(#function)
    }

    //создаём кнопку
    private func createButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        button.center = view.center
        button.setTitle("Open", for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(button)
        print(#function)
    }

    //действия при нажатии на кнопку
    @objc private func tapAction() {
        let postVC = PostViewController()
        postVC.title = post.title
        navigationController?.pushViewController(postVC, animated: true)
        print(#function)
    }
}
