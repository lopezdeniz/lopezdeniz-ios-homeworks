//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by MacBook Air on 15.12.2022.
//

import UIKit

final class ProfileHeaderView: UIView, UITextFieldDelegate {
    
    private lazy var pagePadding = CGFloat(16)
    private lazy var avatarSize = CGFloat(220 - 3 * 16 - 50)

    private lazy var avatarImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "coolCat.jpg")
        img.clipsToBounds = true
        img.layer.cornerRadius = avatarSize / 2
        img.layer.borderWidth = 3
        img.layer.borderColor = UIColor.systemMint.cgColor
        img.translatesAutoresizingMaskIntoConstraints = false

        return img
    }()

    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Cool Cat"
        label.font = .boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Change the default status!"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    private lazy var statusTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "new status"
        field.font = .systemFont(ofSize: 15)
        field.backgroundColor = .white
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        field.leftViewMode = .always
        field.delegate = self
        field.becomeFirstResponder()
        field.clearButtonMode = .whileEditing
        field.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        field.translatesAutoresizingMaskIntoConstraints = false

        return field
    }()

    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.setTitle("Change status", for: .normal)
        button.backgroundColor = UIColor.systemMint
        button.layer.cornerRadius = 18
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)

        return button
    }()

    private lazy var statusText: String = ""


    

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([

            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: universalS),
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: pagePadding),
            avatarImageView.widthAnchor.constraint(equalToConstant: avatarSize),
            avatarImageView.heightAnchor.constraint(equalToConstant: avatarSize),

            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: pagePadding),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: pagePadding),
            fullNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -pagePadding),

            statusLabel.bottomAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: avatarSize / 2),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: pagePadding),
            statusLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -pagePadding),

            statusTextField.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: pagePadding),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -pagePadding),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),

            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: pagePadding),
            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: pagePadding),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -pagePadding),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    
    @objc func buttonPressed() {
        statusLabel.text = statusText
    }

   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        statusLabel.text = statusText
        return false
    }

    @objc func statusTextChanged() {
        statusText = statusTextField.text ?? "not input new status yet"
    }

    func changeTitle(text: String) {
        fullNameLabel.text = text
    }
}



