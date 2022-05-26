//
//  MainTabBarViewController.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 18.05.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    //MARK: - parameters
    
    //создаём VC для ленты и профиля
    let feedVC = FeedViewController()
    let profileVC = ProfileViewController()

    //photosVC
    let photosVC = PhotosViewController()
    
    //экран авторизации
    let logInVC = LogInViewController()
    
    //MARK: - functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setControllers()
        // Do any additional setup after loading the view.
        print(#function)
    }
    
    //создаём и настраиваем NC для ленты и профиля
    private func setControllers() {
        
        //цвета таббара и иконок
        UITabBar.appearance().backgroundColor = .systemGray6
        UITabBar.appearance().tintColor = .blue
        
        //navigation controllers
        let feedNC = UINavigationController(rootViewController: feedVC)
//        let profileNC = UINavigationController(rootViewController: logInVC)
        let profileNC = UINavigationController(rootViewController: photosVC)
        
        //tab bar titles - подписи под кнопками
        feedNC.tabBarItem.title = "Feed"
        profileNC.tabBarItem.title = "User"
        
        //tab bar images - картинки для кнопок
        feedNC.tabBarItem.image = UIImage(systemName: "house.fill")
        profileNC.tabBarItem.image = UIImage(systemName: "person.crop.circle.fill")
        
        //view colors - цвета view
        feedNC.view.backgroundColor = .brown
        profileNC.view.backgroundColor = .white
        
        //цвет navigationBar для ProfileViewController
        profileNC.navigationBar.backgroundColor = .white
        
        //скрываем navigationBar
        profileNC.navigationBar.isHidden = true
        
        //загружаем созданные NC в TabBar
        viewControllers = [feedNC, profileNC]
        print(#function)
    }
    
}
