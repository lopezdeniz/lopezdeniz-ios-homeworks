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
        img.isUserInteractionEnabled = true
        img.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(avatarAnimation)))
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
    private lazy var transparentView: UIView = {
    let view = UIView(frame: CGRect(x: 0, y: -100, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 100))
        view.backgroundColor = .black
    view.alpha = 0.0
    return view
}()

private lazy var buttonX: UIButton = {
    $0.alpha = 0
    $0.setImage(UIImage(systemName: "xmark"), for: .normal)
    $0.tintColor = .white
    $0.addTarget(self, action: #selector(avatarReturn), for: .touchUpInside)
    $0.translatesAutoresizingMaskIntoConstraints = false
    return $0
}(UIButton())


    private lazy var statusText: String = ""
    private lazy var tabBar = ((superview as? UITableView)?.dataSource as? UIViewController)?.tabBarController?.tabBar
    private lazy var avatarCenter = avatarImageView.center
    private lazy var avatarBounds = avatarImageView.layer.bounds


    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = BackgroundColors.profileHeader
        addSubviews()
        setConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func addSubviews() {
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)
        addSubview(transparentView)
        addSubview(avatarImageView)
        addSubview(buttonX)
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
            buttonX.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Paddings.page),
            buttonX.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -Paddings.page),
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
    
    @objc func avatarAnimation() {
        avatarCenter = avatarImageView.center
        avatarBounds = avatarImageView.bounds

        UIView.animate(withDuration: 0.5) { [self] in
            transparentView.alpha = 0.7
            avatarImageView.layer.borderWidth = 0
            avatarImageView.layer.cornerRadius = 0
            avatarImageView.center = transparentView.center
            avatarImageView.layer.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            tabBar?.frame.origin.y = UIScreen.main.bounds.height
        } completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0.0) { [self] in
                buttonX.alpha = 1
            }
        }
}
    @objc func avatarReturn() {
        UIView.animate(withDuration: 0.3) { [self] in
            buttonX.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.5) { [self] in
                transparentView.alpha = 0
                avatarImageView.layer.borderWidth = 3.0
                avatarImageView.layer.cornerRadius = avatarSize / 2
                avatarImageView.center = avatarCenter
                avatarImageView.bounds = avatarBounds
                if let bar = tabBar {
                    bar.frame.origin.y = UIScreen.main.bounds.height - bar.frame.height
                }
            }
        }
    }
}

extension ProfileHeaderView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        statusLabel.text = statusText
        return false
    }
}
