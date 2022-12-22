//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by MacBook Air on 15.12.2022.
//

import UIKit

final class ProfileHeaderView: UIView {

    private lazy var avatarSize = CGFloat(220.0 - 3 * 16 - 50.0)
    
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

            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: universalS),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: universalS),
            avatarImageView.widthAnchor.constraint(equalToConstant: avatarSize),
            avatarImageView.heightAnchor.constraint(equalToConstant: avatarSize),

            fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: universalS),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: universalS),
            fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -universalS),

            statusLabel.bottomAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: avatarSize / 2),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: universalS),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -universalS),

            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: universalS),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -universalS),

            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: universalS),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: universalS),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -universalS),
            setStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -universalS),
        ])
    }

    
    @objc func buttonPressed() {
        statusLabel.text = statusText
    }

    @objc func statusTextChanged() {
        statusText = statusTextField.text ?? "not input new status yet"
    }

    func changeTitle(text: String) {
        fullNameLabel.text = text
    }
}

extension ProfileHeaderView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        statusLabel.text = statusText
        return false
    }
}
