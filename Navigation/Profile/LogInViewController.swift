//
//  LogInViewController.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 22.05.2022.
//

import Foundation
import UIKit

class LogInViewController: UIViewController {

    override func viewDidLoad() {
        addingElements()
        setLayouts()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notificationCenter.addObserver(self, selector: #selector(kbdShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(kbdHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func kbdShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbdSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
        }
    }

    @objc private func kbdHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

    //добавление элементов
    private func addingElements() {

        view.addSubview(scrollView)
        scrollView.addSubview(subScrollView)
        subScrollView.addSubview(logoVK)
        subScrollView.addSubview(stackView)
        subScrollView.addSubview(logInButton)

        stackView.addArrangedSubview(logInTextField)
        stackView.addArrangedSubview(separatorView)
        stackView.addArrangedSubview(passwordTextField)


    }

    //настройка ограничений
    private func setLayouts() {
        NSLayoutConstraint.activate([

            //scrollView
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            //subScrollView
            subScrollView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            subScrollView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            subScrollView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            subScrollView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            //обязательное ограничение для этого view, находящегося на ScrollView!!! Без него нормально не работает!!!
            subScrollView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            //logoVK
            logoVK.topAnchor.constraint(equalTo: subScrollView.topAnchor, constant: 120),
            logoVK.widthAnchor.constraint(equalToConstant: 100),
            logoVK.heightAnchor.constraint(equalToConstant: 100),
            logoVK.centerXAnchor.constraint(equalTo: subScrollView.centerXAnchor),

            //stackView
            stackView.topAnchor.constraint(equalTo: logoVK.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: subScrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: subScrollView.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 100),

            //logInTextField
            logInTextField.topAnchor.constraint(equalTo: stackView.topAnchor),
            logInTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 10),
            logInTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10),
            logInTextField.bottomAnchor.constraint(equalTo: separatorView.topAnchor),

            //separatorView
            separatorView.heightAnchor.constraint(equalToConstant: 0.5),
            separatorView.topAnchor.constraint(equalTo: logInTextField.bottomAnchor),
            separatorView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            separatorView.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor),

            //passwordTextField
            passwordTextField.topAnchor.constraint(equalTo: separatorView.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 10),
            passwordTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10),
            passwordTextField.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),

            //logInButton
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: subScrollView.leadingAnchor),
            logInButton.trailingAnchor.constraint(equalTo: subScrollView.trailingAnchor),

            //привязка к низу!!! Без неё не работает!!!
            logInButton.bottomAnchor.constraint(equalTo: subScrollView.bottomAnchor)
        ])
    }

    //NotificationCenter
    private let notificationCenter = NotificationCenter.default

    //scrollView
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = .white
        sv.isScrollEnabled = true
        return sv
    }()

    //subScrollView
    let subScrollView: UIView = {
        //let view = UIView()
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())

    //логотип VK
    let logoVK: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "logo")

        //????????????????????????????????????????????????????????????
        //image.clipsToBounds = true
        return image
    }()

    //stackView для полей ввода
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.backgroundColor = .systemGray6
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.spacing = 1
        stackView.alignment = .fill//.leading
        stackView.axis = .vertical
        stackView.distribution = .equalCentering//.fillProportionally
        return stackView
    }()

    //logInTextField
    let logInTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        //textField.backgroundColor = .systemGray6
        //textField.text = "Email or phone number"
        textField.placeholder = "Email or phone number"
        textField.textColor = .black
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular) //normal?????????????
        //textField.autocapitalizationType = .none
        //tint color??????????????????????



        //textField.delegate = self

        return textField
    }()

    //passwordTextField
    let passwordTextField: UITextField = {
        let passwordField = UITextField()
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.placeholder = "Password"
        //passwordField.backgroundColor = .systemGray6
        passwordField.textColor = .black
        passwordField.font = UIFont.systemFont(ofSize: 16, weight: .regular) //normal?????????????
        //tint color??????????????????????
        //passwordField.autocapitalizationType = .none
        passwordField.isSecureTextEntry = true
        return passwordField
    }()

    //separatorView
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()

    //кнопка logIn
    let logInButton: UIButton = {
        let button = UIButton()
        let pixelColor: UIColor = UIColor(patternImage: UIImage(named: "blue_pixel")!) //НЕБЕЗОПАСНО!!!!!!!!!!!!!!!!!!!!!!
        button.backgroundColor = pixelColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        //button.titleLabel?.text = "Show status"
        button.titleLabel?.textColor = .white

        button.layer.cornerRadius = 10

        //        func states() {
        //            switch button.state {
        //            case .normal: button.alpha = 1.0
        //            }
        //        }
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return button
    }()

    @objc private func tapAction() {
        navigationController?.pushViewController(ProfileViewController(), animated: true)
        print(#function)
    }

}

// MARK: - UITextFieldDelegate

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
