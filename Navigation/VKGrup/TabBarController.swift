//
//  TabBarControllerViewController.swift
//  Navigation
//
//  Created by MacBook Air on 19.12.2022.
//

import UIKit

class TabBarController: UITabBarController {

  let vcFeed = FeedViewController()
  let vcLogin = LogInViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.backgroundColor = .systemBackground
        tabBar.tintColor = .systemMint
        
        let ncFeed: UINavigationController = {
            let feed = UINavigationController()
            feed.setViewControllers([vcFeed], animated: true)
            feed.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "book"), tag: 0)
             
            return feed
        }()
        
        let ncProfile: UINavigationController = {
            let feed = UINavigationController()
            feed.setViewControllers([vcLogin], animated: true)
            feed.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 0)
            return feed
        }()

        viewControllers = [ncFeed, ncProfile]
        selectedIndex = 0
    }
}


            
        
        
   
