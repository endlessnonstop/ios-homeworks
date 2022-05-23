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
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Just button", for: .normal)
        $0.backgroundColor = .gray
        return $0
    }(UIButton())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setControllers()
        setLayots()
        // Do any additional setup after loading the view.
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
