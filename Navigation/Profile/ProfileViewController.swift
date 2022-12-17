//
//  ProfileViewController.swift
//  Navigation
//
//  Created by MacBook Air on 15.12.2022.
//

import UIKit

final class ProfileViewController: UIViewController {

    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.frame = view.safeAreaLayoutGuide.layoutFrame
        view.backgroundColor = .systemGray3
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private lazy var setTitleButton: UIButton = {
        let button = UIButton()
        button.setTitle("Set Title", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Profile"
        view.backgroundColor = .systemGray5

        addSubviews()
        setConstraints()
    }

    @objc func buttonPressed() {
        title = "New title"
        profileHeaderView.changeTitle(text: "New label")
    }

    private func addSubviews() {
        view.addSubview(profileHeaderView)
        view.addSubview(setTitleButton)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),

            setTitleButton.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 0),
            setTitleButton.trailingAnchor.constraint(equalTo: profileHeaderView.trailingAnchor, constant: -4), // прижато с учётом тени
            setTitleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16), // привязка к Safe Area
            setTitleButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}


//class ProfileViewController: UIViewController {
//
//    let profileVc = ProfileHeaderView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = UIColor(cgColor: CGColor(gray: 100, alpha: 0.7)) // по заданию очень темный
//
//        title = "Profile"
//
//        view.addSubview(profileVc)
//    }
//
//
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//
//        profileVc.frame = view.safeAreaLayoutGuide.layoutFrame
//        profileVc.backgroundColor = .systemGray3
//
//        let statusFieldHeight = 40
//
//
//        let textWidth = Int(profileVc.frame.width) - profileVc.avatarWHFull - profileVc.pagePadding
//        let buttonWidth = Int(profileVc.frame.width) - profileVc.pagePadding * 2
//
//        profileVc.avatarTitle.frame = CGRect(x: profileVc.avatarWHFull,
//                                             y: 27,
//                                             width: textWidth,
//                                             height: profileVc.fontSize.avatar.rawValue
//        )
//
//        profileVc.statusLabel.frame = CGRect(x: profileVc.avatarWHFull,
//                                             y: profileVc.avatarWHFull - 34 - profileVc.fontSize.statusLabel.rawValue,
//                                             width: textWidth,
//                                             height: profileVc.fontSize.statusLabel.rawValue
//        )
//
//        profileVc.statusField.frame = CGRect(x: profileVc.avatarWHFull,
//                                             y: Int(profileVc.statusLabel.frame.maxY) + profileVc.pagePadding,
//                                             width: textWidth,
//                                             height: statusFieldHeight
//        )
//
//        profileVc.statusButton.frame = CGRect(x: profileVc.pagePadding,
//                                              y: Int(profileVc.statusField.frame.maxY) + profileVc.pagePadding,
//                                              width: buttonWidth,
//                                              height: 50
//        )
//    }
//}
//
