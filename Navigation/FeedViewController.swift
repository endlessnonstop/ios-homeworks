//
//  FeedViewController.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 18.05.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    //MARK: - parameters
    
    //stackView
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.backgroundColor = .green
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    //кнопки
    let button1: UIButton = {
        let button = UIButton()
        button.setTitle("Just button", for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return button
    }()
    
    let button2: UIButton = {
        let button = UIButton()
        button.setTitle("Just button", for: .normal)
        button.backgroundColor = .systemOrange
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return button
    }()
    
    //MARK: - functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        self.title = "User feed"
        
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        
        setLayots()
        // Do any additional setup after loading the view.
    }
    
    //действия при нажатии на кнопку
    @objc private func tapAction() {
        let postVC = PostViewController()
        navigationController?.pushViewController(postVC, animated: true)
    }
    
    //настройка ограничений
    private func setLayots() {
        NSLayoutConstraint.activate([
            
            //stackView
            stackView.topAnchor.constraint(equalTo: super.view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: super.view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: super.view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: super.view.safeAreaLayoutGuide.trailingAnchor)
            
        ])
    }
    
}
