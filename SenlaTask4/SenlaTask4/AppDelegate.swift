//
//  AppDelegate.swift
//  SenlaTask4
//
//  Created by Никита Макаревич on 31.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window : UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        
        let tabBarController = TabBarController()
        
        let navigationController = NavigationController()
        let secondaryViewController = SecondaryViewController()
        
        navigationController.title = "Scissors paper stone"
        secondaryViewController.title = "Dice"
        
        let mainViewController = MainViewController()
        mainViewController.title = "Scissors paper stone"
        
        navigationController.viewControllers = [mainViewController]
        
        tabBarController.viewControllers = [navigationController, secondaryViewController]
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemGray6
        navigationController.navigationBar.scrollEdgeAppearance = appearance
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = tabBarController
        
        return true
    }
    
    
    
}

