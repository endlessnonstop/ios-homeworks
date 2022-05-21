//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 18.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHV = ProfileHeaderView()
    
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Just button", for: .normal)
        button.backgroundColor = .gray
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setControllers()
        setLayots()
        // Do any additional setup after loading the view.
        print(#function)
    }
    
    private func setControllers() {
        view.backgroundColor = .white
        title = "User profile"
        profileHV.backgroundColor = .lightGray
        
        //subview
        view.addSubview(profileHV)
        profileHV.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
    }
    
    //настройка ограничений
    private func setLayots() {
        
        NSLayoutConstraint.activate([
            //profileHV
            profileHV.topAnchor.constraint(equalTo: super.view.safeAreaLayoutGuide.topAnchor),
            profileHV.leadingAnchor.constraint(equalTo: super.view.leadingAnchor),
            profileHV.trailingAnchor.constraint(equalTo: super.view.trailingAnchor),
            profileHV.heightAnchor.constraint(equalToConstant: 220),
            
            //button
            button.leadingAnchor.constraint(equalTo: super.view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: super.view.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: super.view.safeAreaLayoutGuide.bottomAnchor),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
