//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by MacBook Air on 15.12.2022.
//

import UIKit

final class ProfileHeaderView: UIView, UITextFieldDelegate {

    private let avatar = UIImageView()
    let avatarTitle = UILabel()
    let statusLabel = UILabel()
    let statusField = UITextField()
    let statusButton = UIButton()

    let pagePadding = 16
    let avatarSize = 170
    var avatarWHFull: Int = 0

    enum FontSize: Int {
        case statusLabel = 14
        case statusField = 15
        case avatar = 18
    }
    let fontSize = FontSize.self

    private let textFieldRadius = 12
    private var statusText: String = ""


    override init(frame: CGRect) {
        super.init(frame: frame)

        avatarWHFull = avatarSize + pagePadding * 2

        avatar.frame = CGRect(x: pagePadding, y: pagePadding, width: avatarSize, height: avatarSize)
        avatar.image = UIImage(named: "coolCat.jpg")
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = UIColor.systemMint.cgColor
        avatar.layer.cornerRadius = avatar.frame.width / 2
        avatar.clipsToBounds = true
        addSubview(avatar)

        avatarTitle.font = .boldSystemFont(ofSize: CGFloat(fontSize.avatar.rawValue))
        avatarTitle.text = "Cool Cat"
        addSubview(avatarTitle)

        statusLabel.textColor = .gray
        statusLabel.font = .systemFont(ofSize: CGFloat(fontSize.statusLabel.rawValue))
        statusLabel.text = "Change the default status"
        addSubview(statusLabel)

        statusField.backgroundColor = .white
        statusField.font = .systemFont(ofSize: CGFloat(fontSize.statusField.rawValue))
        statusField.layer.cornerRadius = CGFloat(textFieldRadius)
        statusField.layer.borderWidth = 1
        statusField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: textFieldRadius, height: 0))
        statusField.leftViewMode = .always
        statusField.delegate = self
        statusField.becomeFirstResponder()
        statusField.clearButtonMode = .whileEditing
        statusField.placeholder = "new status"
        statusField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        addSubview(statusField)

        statusButton.backgroundColor = UIColor.systemMint
        statusButton.layer.cornerRadius = 15
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.setTitle("Change status", for: .normal)
        statusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        addSubview(statusButton)
    }

     
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func buttonPressed() {
        statusLabel.text = statusText
    }

     
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        statusLabel.text = statusText
        return false
    }

    @objc func statusTextChanged() {
        statusText = statusField.text ?? "not input new status yet"
    }

}

    

  
