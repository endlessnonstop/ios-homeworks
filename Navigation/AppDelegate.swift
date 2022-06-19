//
//  AppDelegate.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 17.05.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //создаём новый window
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //присваиваем window размеры экрана устройства
        window = UIWindow(frame: UIScreen.main.bounds)
        
        //присваиваем TabBarController в качестве root
        window?.rootViewController = TabBarController()
        
        //делаем window видимым
        window?.makeKeyAndVisible()
        
        return true
    }
}

