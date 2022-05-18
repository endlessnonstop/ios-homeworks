//
//  MainTabBarViewController.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 18.05.2022.
//

import UIKit

class TabBarController: UITabBarController {

    let feedVC = FeedViewController()
    let profileVC = ProfileViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
        // Do any additional setup after loading the view.
        print(#function)
    }

    private func setupControllers() {
        //navigation controllers
        let feedNC = UINavigationController(rootViewController: feedVC)
        let profileNC = UINavigationController(rootViewController: profileVC)
        //tab bar titles
        feedNC.tabBarItem.title = "Feed"
        profileNC.tabBarItem.title = "User"

        //tab bar images
        feedNC.tabBarItem.image = UIImage(systemName: "house.fill")
        profileNC.tabBarItem.image = UIImage(systemName: "person.crop.circle.fill")

        //view colors
        feedNC.view.backgroundColor = .brown
        profileNC.view.backgroundColor = .cyan

        //navigation item titles
        //feedNC.navigationItem.title = "Текст1"

        viewControllers = [feedNC, profileNC]
        print(#function)
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
