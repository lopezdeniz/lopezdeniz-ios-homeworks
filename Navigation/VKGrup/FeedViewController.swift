//
//  FeedViewController.swift
//  Navigation
//
//  Created by MacBook Air on 10.12.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
        button.layer.cornerRadius = 0.1 * button.bounds.size.width
        button.backgroundColor = UIColor.systemMint
        button.setTitle("See youre Feed Posts", for: .normal)
        button.addTarget(self, action: #selector(press), for: .touchUpInside)
        view.addSubview(button)
        
        
    }
    
    @objc func press() {
        
        let vcPost = PostViewController()
        let post = Post(title: "Here you see Post")
        vcPost.post = post
    
        navigationController?.pushViewController(vcPost, animated: true)
        navigationController?.viewControllers.forEach{vc in print(vc)}
        
    }
}
        
        
        
  
