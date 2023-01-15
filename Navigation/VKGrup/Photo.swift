//
//  Photo.swift
//  Navigation
//
//  Created by MacBook Air on 10.01.2023.
//

import UIKit

class Photo: UIViewController {

    var name: String?

    private lazy var img: UIImageView = {
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = BackgroundColors.mainView
        navigationController?.navigationBar.isHidden = false
        let imgName = name ?? "1s"
        title = imgName
        img.image = UIImage(named: imgName)
        view.addSubview(img)

        NSLayoutConstraint.activate([

            img.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            img.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            img.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            img.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

        ])
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.tabBarController?.tabBar.isHidden = true
    }
}
