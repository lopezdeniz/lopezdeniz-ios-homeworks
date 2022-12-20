//
//  FeedViewController.swift
//  Navigation
//
//  Created by MacBook Air on 10.12.2022.
//

import UIKit

final class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white

        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])



        let btn = UIButton()
        stackView.addArrangedSubview(btn)
        btn.setTitle("See post", for: .normal)
        btn.backgroundColor = .systemMint
        btn.layer.cornerRadius = 17
        btn.layer.shadowOffset = CGSize(width: 4, height: 4)
        btn.layer.shadowRadius = 4
        btn.layer.shadowColor = UIColor.black.cgColor
        btn.layer.shadowOpacity = 0.7
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.widthAnchor.constraint(equalToConstant: 200).isActive = true
        btn.addTarget(self, action: #selector(pressFunc), for: .touchUpInside)
        
        let btn2 = UIButton()
        stackView.addArrangedSubview(btn2)
        btn2.setTitle("Go to Log in", for: .normal)
        btn2.backgroundColor = .systemMint
        btn2.layer.cornerRadius = 17
        btn2.layer.shadowOffset = CGSize(width: 4, height: 4)
        btn2.layer.shadowRadius = 4
        btn2.layer.shadowColor = UIColor.black.cgColor
        btn2.layer.shadowOpacity = 0.7
        btn2.translatesAutoresizingMaskIntoConstraints = false
        btn2.widthAnchor.constraint(equalToConstant: 200).isActive = true
        btn2.addTarget(self, action: #selector(pressFunc2), for: .touchUpInside)
        
    }

    @objc func pressFunc() {

        let vcPost = PostViewController()
        let post = Post(title: "Here you see Post")
        vcPost.post = post
        navigationController?.pushViewController(vcPost, animated: true)
    }
    
    @objc func pressFunc2() {

        let log = LogInViewController()
        navigationController?.pushViewController(log, animated: true)
    }
}
