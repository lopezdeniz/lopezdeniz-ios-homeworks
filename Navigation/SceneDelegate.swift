//
//  SceneDelegate.swift
//  Navigation
//
//  Created by MacBook Air on 09.12.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let myScene = (scene as? UIWindowScene) else { return }

        let tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = UIColor(white: 30, alpha: 40)
        tabBarController.tabBar.tintColor = .systemMint
        tabBarController.tabBar.unselectedItemTintColor = .systemGray
        
        let ncFeed = UINavigationController()
        let ncProfile = UINavigationController()
        tabBarController.viewControllers = [ncFeed, ncProfile]
        
        ncFeed.tabBarItem = UITabBarItem(title: "MyFeed", image: UIImage(systemName: "hourglass.tophalf.filled"), tag: 0)
        ncProfile.tabBarItem = UITabBarItem(title: "MyProfile", image: UIImage(systemName: "person.circle.fill"), tag: 0)
        let vcFeed = FeedViewController()
        let vcProfile = ProfileViewController()
                                                              
        ncFeed.setViewControllers([vcFeed], animated: true)
        ncProfile.setViewControllers([vcProfile], animated: true)

        let window = UIWindow(windowScene: myScene)
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
       
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
       
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }


}

