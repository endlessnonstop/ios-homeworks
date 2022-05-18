//
//  PostViewController.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 18.05.2022.
//

import UIKit

class PostViewController: UIViewController {    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //присваиваем title
        if self.title == nil {
            //если не был передан извне, то присваиваем дефолтное значение
            self.title = "Default post title"
        }
        self.view.backgroundColor = .green
        createBarButtonItem()
        // Do any additional setup after loading the view.
        print(#function)
    }
    
    //создание кнопки BarButton
    private func createBarButtonItem() {
        let barButtonItem = UIBarButtonItem(title: "Инфо", style: .plain, target: self, action: #selector(tapAction))
        //присваиваем кнопке справа
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    //tap action
    @objc private func tapAction() {
        let infoVC = InfoViewController()
        //показываем модально
        present(infoVC, animated: true)
    }
}
