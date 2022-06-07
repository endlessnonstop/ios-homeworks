//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 18.05.2022.
//

import Foundation
import UIKit

protocol ProfileHeaderViewDelegate: AnyObject{
    func showAvatarImage()// -> (NSArray)
    func getMainViewCenterY() -> (NSLayoutYAxisAnchor)
}

//header для таблицы, основные данные пользователя
class ProfileHeaderView: UIView {
    
    //MARK: - override inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        //добавление элементов
        addSubview(setStatusButton)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(transparencyView)
        addSubview(avatarImageView)
        addSubview(closeButton)
        
        //настройка ограничений
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - parameters

    //NotificationCenter
    private let notificationCenter = NotificationCenter.default

    //делегат?????????????????????????
    //weak var delegate: ProfileHeaderViewDelegate?
    
    //аватар профиля
    lazy var avatarImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "profileImage")
        $0.layer.cornerRadius = 60
        $0.clipsToBounds = true
        $0.layer.borderWidth = 3
        $0.layer.borderColor = UIColor.white.cgColor

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnAvatarImageView))
        $0.isUserInteractionEnabled = true
        $0.addGestureRecognizer(tapGesture)
        return $0
    }(UIImageView())

    //констрейнты для аватара профиля
    private var topAvatarImageView = NSLayoutConstraint()
    private var leadingAvatarImageView = NSLayoutConstraint()
    private var widthAvatarImageView = NSLayoutConstraint()
    private var heightAvatarImageView = NSLayoutConstraint()
    private var trailingAvatarImageView = NSLayoutConstraint()
    private var centerXAvatarImageView = NSLayoutConstraint()
    private var centerYAvatarImageView = NSLayoutConstraint()

    private var topStatusButton = NSLayoutConstraint()

    //переменная для сохранения изначальной позиции аватара
    lazy var avatarImageViewFrame = avatarImageView.frame

    //полупрозрачная вью под увеличенное изображение профиля
    private lazy var transparencyView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isUserInteractionEnabled = false
        $0.alpha = 0.0
        $0.backgroundColor = .black
        $0.frame = UIScreen.main.bounds
        return $0
    }(UIView())

    //кнопка закрытия увеличенного изображения профиля
    lazy var closeButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.alpha = 0.0
        $0.isUserInteractionEnabled = false
        $0.setImage(UIImage(systemName: "xmark.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 50))?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        $0.addTarget(self, action: #selector(closeButtonTap), for: .touchUpInside)
        return $0
    }(UIButton())

    
    //имя профиля
    let fullNameLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Evgenii Zhuravlev"
        $0.font = UIFont.boldSystemFont(ofSize: 18)
        $0.textColor = UIColor.black
        return $0
    }(UILabel())
    
    //кнопка show status
    let setStatusButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Set status", for: .normal)
        $0.titleLabel?.textColor = .white
        $0.backgroundColor = .blue
        $0.layer.cornerRadius = 4
        $0.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        $0.layer.shadowRadius = 4
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.7
        $0.addTarget(self, action: #selector(tapOnStatusButtonAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    //текст статуса
    let statusLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Status message..."
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = UIColor.gray
        $0.backgroundColor = .systemGray6
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    //statusTextField
    lazy var statusTextField: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        $0.textColor = .black
        $0.layer.cornerRadius = 12
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        //для отступа текста от края вью
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        $0.leftViewMode = .always
        $0.delegate = self
        $0.placeholder = "Введите новый текст статуса"
        return $0
    }(UITextField())
    
    //MARK: - functions
    
    //действие при нажатии кнопки изменения статуса
    @objc private func tapOnStatusButtonAction() {
        //если поле ввода пустое
        if statusTextField.text == "" {
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .autoreverse) {
                self.statusTextField.layer.borderColor = UIColor.red.cgColor
            } completion: { _ in
                self.statusTextField.layer.borderColor = UIColor.black.cgColor
            }
            return
        } else {
            statusLabel.text = statusTextField.text
            statusTextField.text = ""
        }

        statusTextField.endEditing(true)
    }

    //настройка жестов???????????????????????????????????????????????
    @objc func setGestures() {

    }

    //действие при нажатии на изображение аватара
    @objc private func tapOnAvatarImageView() {
        print(#function)

        avatarImageViewFrame = avatarImageView.frame

        NSLayoutConstraint.deactivate([

            //setStatusButton
            topStatusButton

        ])

        UIView.animate(withDuration: 0.5,
                       delay: 0.2,
                       usingSpringWithDamping: 0.8,
                       initialSpringVelocity: 0.3,
                       options: .curveEaseInOut) {

            self.transparencyView.alpha = 0.5
            self.setStatusButton.isUserInteractionEnabled = false
            self.avatarImageView.frame = CGRect(x: 0, y: (UIScreen.main.bounds.height - UIScreen.main.bounds.width) / 2 - 32, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            self.avatarImageView.layer.cornerRadius = 0
            self.avatarImageView.layer.borderWidth = 0

        } completion: { _ in

            UIView.animate(withDuration: 0.3) {
                self.closeButton.alpha = 1.0
            }

        }
        closeButton.isUserInteractionEnabled = true

    }

    //
    @objc private func closeButtonTap() {
        print(#function)

        UIView.animate(withDuration: 0.3) {
            self.closeButton.alpha = 0.0
        } completion: { _ in

            UIView.animate(withDuration: 0.5,
                           delay: 0.2,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0.3,
                           options: .curveEaseInOut) {

                self.transparencyView.alpha = 0.0
                self.setStatusButton.isUserInteractionEnabled = true //???????????????????????????????????????????
                self.avatarImageView.frame = self.avatarImageViewFrame
                self.avatarImageView.layer.cornerRadius = 60
                self.avatarImageView.layer.borderWidth = 3

            }

        }

        NSLayoutConstraint.activate([

            //setStatusButton
            topStatusButton

        ])

        closeButton.isUserInteractionEnabled = false

    }
    
    //настройка ограничений
    private func setLayouts() {

        topAvatarImageView = avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
        leadingAvatarImageView = avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16)
        widthAvatarImageView = avatarImageView.widthAnchor.constraint(equalToConstant: 120)
        heightAvatarImageView = avatarImageView.heightAnchor.constraint(equalToConstant: 120)
        trailingAvatarImageView = avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)

        topAvatarImageView.isActive = true
        leadingAvatarImageView.isActive = true
        widthAvatarImageView.isActive = true
        heightAvatarImageView.isActive = true

        topStatusButton = setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16)

        NSLayoutConstraint.activate([

            //fullNameLabel
            fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            //setStatusButton
            topStatusButton,
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),

            
            //statusLabel
            statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -16),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.heightAnchor.constraint(equalToConstant: 24),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            //statusTextField
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),

            //closeButton
            closeButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            closeButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10)

        ])

    }
    
}

////
//
//extension ProfileHeaderView: UITextFieldDelegate {
//
//}


extension ProfileHeaderView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return true
    }
}
