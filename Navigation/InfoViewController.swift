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
        if self.title == nil {
            self.title = "Default info title"
        }
        createButton()
        // Do any additional setup after loading the view.
    }

    private func createButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        button.center = view.center
        button.setTitle("Нажми", for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(button)
        print(#function)
    }

    @objc private func tapAction() {
        let alert = UIAlertController(title: "Внимание!", message: "Сообщение", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК", style: .default) { _ in
            print("Нажата кнопка OK")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { _ in
            print("Нажата кнопка Cancel")
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
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
