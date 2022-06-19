//
//  LogInViewController.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 22.05.2022.
//

import Foundation
import UIKit

class LogInViewController: UIViewController {
    
    //MARK: - parameters

    //стандартные логин и пароль
    let standartLogIn = "login"
    let standartPassword = "password"
    
    //NotificationCenter
    private let notificationCenter = NotificationCenter.default
    
    //scrollView
    let scrollView: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.isScrollEnabled = true
        return $0
    }(UIScrollView())
    
    //subScrollView
    let subScrollView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    //логотип VK
    let logoVK: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "logo")
        return $0
    }(UIImageView())
    
    //stackView для полей ввода
    let stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.backgroundColor = .systemGray6
        $0.layer.borderWidth = 0.5
        $0.layer.cornerRadius = 10
        $0.spacing = 1
        $0.alignment = .fill
        $0.axis = .vertical
        $0.distribution = .equalCentering
        return $0
    }(UIStackView())
    
    //logInTextField
    lazy var logInTextField: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "Email or phone number"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.autocapitalizationType = .none
        $0.delegate = self
        $0.text = standartLogIn
        return $0
    }(UITextField())
    
    //passwordTextField
    lazy var passwordTextField: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "Password"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.autocapitalizationType = .none
        $0.delegate = self
        $0.isSecureTextEntry = true
        $0.text = standartPassword
        return $0
    }(UITextField())
    
    //separatorView
    let separatorView: UIView = {
        $0.backgroundColor = .lightGray
        return $0
    }(UIView())
    
    //кнопка logIn
    lazy var logInButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        if let bluePixel = UIImage(named: "blue_pixel") {
            $0.setBackgroundImage(UIImage(named: "blue_pixel")?.alpha(1.0), for: .normal)
            $0.setBackgroundImage(UIImage(named: "blue_pixel")?.alpha(0.8), for: .selected)
            $0.setBackgroundImage(UIImage(named: "blue_pixel")?.alpha(0.8), for: .highlighted)
            $0.setBackgroundImage(UIImage(named: "blue_pixel")?.alpha(0.8), for: .disabled)
        } else {
            $0.backgroundColor = blueHexColor
        }
        $0.setTitle("Log In", for: .normal)
        $0.titleLabel?.textColor = .white
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return $0
    }(UIButton())

    //allertLabel
    lazy var alertLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.alpha = 0.0
        $0.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        $0.textColor = .red
        $0.text = ""
        return $0
    }(UILabel())
    
    //MARK: - functions

    //нажатие на кнопку
    @objc private func tapAction() {

        //если любое из полей ввода пустое или пароль меньше минимального количества символов
        if logInTextField.text == "" || passwordTextField.text == "" || passwordTextField.text?.count ?? 0 < 8 {
            //если пусто поле ввода логина
            if logInTextField.text == "" {

                logInTextField.attributedPlaceholder = NSAttributedString (string: "Email or phone number",
                                                                           attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            }
            //если пусто поле ввода пароля
            if passwordTextField.text == "" {

                passwordTextField.attributedPlaceholder = NSAttributedString (string: "Password",
                                                                           attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            }
            //если пароль меньше минимального количества символов
            if passwordTextField.text?.count ?? 0 < 8 {
                alertLabel.text = "Пароль не может быть меньше 8 символов!"
                alertLabel.alpha = 1.0
            }
            return
        } else if logInTextField.text != standartLogIn || passwordTextField.text != standartPassword {

            alertLabel.alpha = 0.0

            let alert = UIAlertController(title: "Warning!", message: "Пароль или логин введен неправильно!", preferredStyle: .alert)

            //action для alert
            let okAction = UIAlertAction(title: "ОК", style: .default) { _ in
                print("Нажата кнопка OK")
            }

            //добавляем actions в alert
            alert.addAction(okAction)
            present(alert, animated: true)

            return
        }

        alertLabel.alpha = 0.0
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    override func viewDidLoad() {
        addingElements()
        setLayouts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notificationCenter.addObserver(self, selector: #selector(keyBoardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyBoardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyBoardShow(notification: NSNotification) {
        if let keyBoardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyBoardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyBoardSize.height, right: 0)
        }
    }
    
    @objc private func keyBoardHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    //добавление элементов
    private func addingElements() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(subScrollView)
        
        [logoVK, stackView, logInButton, alertLabel].forEach { subScrollView.addSubview($0) }
        
        [logInTextField, separatorView, passwordTextField].forEach { stackView.addArrangedSubview($0) }
        
    }
    
    //настройка ограничений
    private func setLayouts() {
        NSLayoutConstraint.activate([
            
            //scrollView
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
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

            //alertLabel
            alertLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0),
            alertLabel.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            
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
    
}

// MARK: - UITextFieldDelegate

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
