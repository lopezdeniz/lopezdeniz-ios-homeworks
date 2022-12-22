//
//  PostViewController.swift
//  Navigation
//
//  Created by MacBook Air on 10.12.2022.
//

 

import UIKit

final class PostViewController: UIViewController {

    var post: Post?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Post"
        view.backgroundColor = .systemMint

        title = post?.author ?? "no author"

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Info", style: .done, target: self, action: #selector(press))
    }

    @objc func press() { present(InfoViewController(), animated: true) }
}
