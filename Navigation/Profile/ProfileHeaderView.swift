//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 18.05.2022.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {

    //настройка ограничений
    private func setLayouts() {
        NSLayoutConstraint.activate([
            //avatarImageView
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),
            avatarImageView.heightAnchor.constraint(equalToConstant: 120),

            //setStatusButton
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),

            //fullNameLabel
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),

            //statusLabel
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -34),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            //statusLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            statusLabel.heightAnchor.constraint(equalToConstant: 24),
            //statusLabel.widthAnchor.constraint(equalToConstant: 100)
            statusLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }

    //аватар профиля
    let avatarImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .white
        image.image = UIImage(named: "profileImage")
        image.layer.cornerRadius = 60
        image.clipsToBounds = true
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        return image
    }()

    //имя профиля
    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Profile Name"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.black
        return label
    }()

    //кнопка show status
    let setStatusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show status", for: .normal)
        button.titleLabel?.text = "Show status"
        button.titleLabel?.textColor = .white
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return button
    }()

    //действие при нажатии кнопки
    @objc private func tapAction() {
        print(statusLabel.text ?? "no status text")
    }

    //текст статуса
    let statusLabel: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Status message..."
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.textColor = UIColor.gray
        textView.backgroundColor = UIColor.lightGray
        return textView
    }()

    //statusTextField
    let statusTextField: UITextField = {
        let textField = UITextField()
        return textField
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        //добавление элементов
        addSubview(avatarImageView)
        addSubview(setStatusButton)
        addSubview(fullNameLabel)
        addSubview(statusLabel)

        setLayouts()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
