//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 18.05.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHV = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setControllers()
        // Do any additional setup after loading the view.
        print(#function)
    }
    
    private func setControllers() {
        view.backgroundColor = .white
        title = "User profile"
        profileHV.backgroundColor = .lightGray
        
        //subview
        view.addSubview(profileHV)
    }
    
    //присвоение размеров родительской view
    override func viewWillLayoutSubviews() {
        profileHV.frame = view.safeAreaLayoutGuide.layoutFrame
    }
    
}
