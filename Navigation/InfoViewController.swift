//
//  InfoViewController.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 18.05.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        //присваиваем title
        if self.title == nil {
            //если не был передан извне, то присваиваем дефолтное значение
            self.title = "Default info title"
        }
        createButton()
        // Do any additional setup after loading the view.
    }

    //создаём кнопку
    private func createButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        button.center = view.center
        button.setTitle("Нажми", for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(button)
        print(#function)
    }

    //действия при нажатии на кнопку
    @objc private func tapAction() {
        //окно alert
        let alert = UIAlertController(title: "Внимание!", message: "Сообщение", preferredStyle: .alert)
        //action для alert
        let okAction = UIAlertAction(title: "ОК", style: .default) { _ in
            print("Нажата кнопка OK")
        }
        //action для alert
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { _ in
            print("Нажата кнопка Cancel")
        }
        //добавляем actions в alert
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}
