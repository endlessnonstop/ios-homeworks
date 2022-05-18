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
        if self.title == nil {
            self.title = "Default post title"
        }
        self.view.backgroundColor = .green
        createBarButtonItem()
        // Do any additional setup after loading the view.
        print(#function)
    }

    //создание кнопки
    private func createBarButtonItem() {
        let barButtonItem = UIBarButtonItem(title: "Инфо", style: .plain, target: self, action: #selector(tapAction))
        navigationItem.rightBarButtonItem = barButtonItem
    }

    //tap action
    @objc private func tapAction() {
        let infoVC = InfoViewController()
        present(infoVC, animated: true)
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
