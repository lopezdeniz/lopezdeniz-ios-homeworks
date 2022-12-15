//
//  ProfileViewController.swift
//  Navigation
//
//  Created by MacBook Air on 15.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileVc = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(cgColor: CGColor(gray: 100, alpha: 0.7)) // по заданию очень темный
        
        title = "Profile"

        view.addSubview(profileVc)
    }
    

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        profileVc.frame = view.safeAreaLayoutGuide.layoutFrame
        profileVc.backgroundColor = .systemGray3

        let statusFieldHeight = 40

        
        let textWidth = Int(profileVc.frame.width) - profileVc.avatarWHFull - profileVc.pagePadding
        let buttonWidth = Int(profileVc.frame.width) - profileVc.pagePadding * 2

        profileVc.avatarTitle.frame = CGRect(x: profileVc.avatarWHFull,
                                             y: 27,
                                             width: textWidth,
                                             height: profileVc.fontSize.avatar.rawValue
        )

        profileVc.statusLabel.frame = CGRect(x: profileVc.avatarWHFull,
                                             y: profileVc.avatarWHFull - 39 - profileVc.fontSize.statusLabel.rawValue,
                                             width: textWidth,
                                             height: profileVc.fontSize.statusLabel.rawValue
        )

        profileVc.statusField.frame = CGRect(x: profileVc.avatarWHFull,
                                             y: Int(profileVc.statusLabel.frame.maxY) + profileVc.pagePadding, 
                                             width: textWidth,
                                             height: statusFieldHeight
        )

        profileVc.statusButton.frame = CGRect(x: profileVc.pagePadding,
                                              y: Int(profileVc.statusField.frame.maxY) + profileVc.pagePadding,
                                              width: buttonWidth,
                                              height: 50
        )
    }
}

