//
//  LogInViewController.swift
//  Navigation
//
//  Created by MacBook Air on 19.12.2022.
//

import UIKit

final class LogInViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

   
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var logoVK: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "AppIcon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let loginForm: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .systemGray6
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.layer.cornerRadius = 10
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.clipsToBounds = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var loginField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email or phone"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: universalS, height: 0))
        textField.leftViewMode = .always
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.backgroundColor = .systemGray6
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var passwordField: UITextField = {
        let textField2 = UITextField()
        textField2.placeholder = "Password"
        textField2.leftView = UIView(frame: CGRect(x: 0, y: 0, width: universalS, height: 0))
        textField2.leftViewMode = .always
        textField2.isSecureTextEntry = true
        textField2.autocapitalizationType = .none
        textField2.backgroundColor = .systemGray6
        textField2.textColor = .black
        textField2.font = .systemFont(ofSize: 16)
        textField2.tintColor = UIColor(named: "colorVK")
        textField2.translatesAutoresizingMaskIntoConstraints = false
        return textField2
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        if let img = UIImage(named: "BluePixel") {
            button.setBackgroundImage(img, for: .normal)
        } else {
            button.backgroundColor = UIColor.init(named: "MyColorSet")
        }
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.alpha = (button.isSelected || button.isHighlighted ) ? 0.8 : 1.0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        addSubviews()
        setConstraints()
        setupTapGesture()
         
    }

    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoVK)
        contentView.addSubview(button)
        contentView.addSubview(loginForm)
        loginForm.addArrangedSubview(loginField)
        loginForm.addArrangedSubview(passwordField)
    }

   
   


    private func setConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide


        NSLayoutConstraint.activate([

            scrollView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),

            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            logoVK.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoVK.widthAnchor.constraint(equalToConstant: logoVKsize.w),
            logoVK.heightAnchor.constraint(equalToConstant: logoVKsize.h),
            logoVK.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            loginForm.topAnchor.constraint(equalTo: logoVK.bottomAnchor, constant: 120),
            loginForm.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: universalS),
            loginForm.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -universalS),

            loginField.topAnchor.constraint(equalTo: loginForm.topAnchor),
            loginField.leadingAnchor.constraint(equalTo: loginForm.leadingAnchor),
            loginForm.trailingAnchor.constraint(equalTo: loginForm.trailingAnchor),
            loginField.heightAnchor.constraint(equalToConstant: 50),

            passwordField.topAnchor.constraint(equalTo: loginField.bottomAnchor),
            passwordField.leadingAnchor.constraint(equalTo: loginForm.leadingAnchor),
            passwordField.trailingAnchor.constraint(equalTo: loginForm.trailingAnchor),
            passwordField.heightAnchor.constraint(equalToConstant: 50),

            button.topAnchor.constraint(equalTo: loginForm.bottomAnchor, constant: universalS),
            button.leadingAnchor.constraint(equalTo: loginForm.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: loginForm.trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),

            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    @objc func pressButton() {

        let vcProfile = ProfileViewController()
        navigationController?.pushViewController(vcProfile, animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(showKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func showKeyboard(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        let keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        var contentInset:UIEdgeInsets = scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 2 * universalS
        scrollView.contentInset = contentInset
    }

    @objc fileprivate func hideKeyboard(_ notification: NSNotification) {
        scrollView.contentInset = .zero
    }

    fileprivate func setupTapGesture() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapNear)))
    }

    @objc fileprivate func tapNear() {
        view.endEditing(true)
        view.layoutIfNeeded()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    
}

