//
//  LogInViewController.swift
//  Navigation
//
//  Created by MacBook Air on 19.12.2022.
//

import UIKit

final class LogInViewController: UIViewController {

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

   
    private lazy var scrollView: UIScrollView = {
        let v = UIScrollView()
        v.backgroundColor = .white
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

   
    private lazy var contentView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private lazy var logoVK: UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "AppIcon")
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    let loginForm: UIStackView = {
        let v = UIStackView()
        v.backgroundColor = .systemGray6
        v.axis = .vertical
        v.distribution = .fillEqually
        v.alignment = .fill
        v.layer.cornerRadius = 10
        v.layer.borderColor = UIColor.lightGray.cgColor
        v.layer.borderWidth = 0.5
        v.clipsToBounds = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private lazy var loginField: UITextField = {
        let v = UITextField()
        v.placeholder = "Email or phone"
        v.leftView = UIView(frame: CGRect(x: 0, y: 0, width: universalS, height: 0))
        v.leftViewMode = .always
        v.layer.borderColor = UIColor.lightGray.cgColor
        v.layer.borderWidth = 0.5
        v.backgroundColor = .systemGray6
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private lazy var passwordField: UITextField = {
        let v = UITextField()
        v.placeholder = "Password"
        v.leftView = UIView(frame: CGRect(x: 0, y: 0, width: universalS, height: 0))
        v.leftViewMode = .always
        v.isSecureTextEntry = true
        v.autocapitalizationType = .none
        v.backgroundColor = .systemGray6
        v.textColor = .black
        v.font = .systemFont(ofSize: 16)
        v.tintColor = UIColor(named: "colorVK")
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    private lazy var button: UIButton = {
        let v = UIButton()
        v.setTitle("Login", for: .normal)
        if let img = UIImage(named: "BluePixel") {
            v.setBackgroundImage(img, for: .normal)
        } else {
            v.backgroundColor = UIColor.init(named: "MyColorSet")
        }
        v.layer.cornerRadius = 10
        v.clipsToBounds = true
        v.alpha = (v.isSelected || v.isHighlighted ) ? 0.8 : 1.0
        v.translatesAutoresizingMaskIntoConstraints = false
        v.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        return v
    }()


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

