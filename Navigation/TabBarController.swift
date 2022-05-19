//
//  MainTabBarViewController.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 18.05.2022.
//

import UIKit

class TabBarController: UITabBarController {
    
    //создаём VC для ленты и профиля
    let feedVC = FeedViewController()
    let profileVC = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setControllers()
        // Do any additional setup after loading the view.
        print(#function)
    }
    
    //создаём и настраиваем NC для ленты и профиля
    private func setControllers() {
        //цвета таббара и иконок
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().tintColor = .blue
        //navigation controllers
        let feedNC = UINavigationController(rootViewController: feedVC)
        let profileNC = UINavigationController(rootViewController: profileVC)
        
        //tab bar titles - подписи под кнопками
        feedNC.tabBarItem.title = "Feed"
        profileNC.tabBarItem.title = "User"
        
        //tab bar images - картинки для кнопок
        feedNC.tabBarItem.image = UIImage(systemName: "house.fill")
        profileNC.tabBarItem.image = UIImage(systemName: "person.crop.circle.fill")
        
        //view colors - цвета view
        feedNC.view.backgroundColor = .brown
        profileNC.view.backgroundColor = .cyan

        //цвет navigationBar для ProfileViewController
        profileNC.navigationBar.backgroundColor = .white
        
        //загружаем созданные NC в TabBar
        viewControllers = [feedNC, profileNC]
        print(#function)
    }
}
