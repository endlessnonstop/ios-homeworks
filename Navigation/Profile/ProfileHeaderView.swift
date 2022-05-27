//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 18.05.2022.
//

import Foundation
import UIKit

//header для таблицы, основные данные пользователя

class ProfileHeaderView: UIView {
    
    //MARK: - override inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        
        //добавление элементов
        addSubview(avatarImageView)
        addSubview(setStatusButton)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        
        //настройка ограничений
        setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - parameters
    
    //аватар профиля
    let avatarImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "profileImage")
        $0.layer.cornerRadius = 60
        $0.clipsToBounds = true
        $0.layer.borderWidth = 3
        $0.layer.borderColor = UIColor.white.cgColor
        return $0
    }(UIImageView())
    
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
        $0.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return $0
    }(UIButton())
    
    //текст статуса
    let statusLabel: UITextView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Status message..."
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textColor = UIColor.gray
        $0.backgroundColor = UIColor.lightGray
        return $0
    }(UITextView())
    
    //statusTextField
    let statusTextField: UITextField = {
        return $0
    }(UITextField())
    
    //MARK: - functions
    
    //действие при нажатии кнопки
    @objc private func tapAction() {
        print(statusLabel.text ?? "no status text")
    }
    
    //настройка ограничений
    private func setLayouts() {
        NSLayoutConstraint.activate([
            
            //avatarImageView
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),
            avatarImageView.heightAnchor.constraint(equalToConstant: 120),
            
            //setStatusButton
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            
            //fullNameLabel
            fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            //statusLabel
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -34),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.heightAnchor.constraint(equalToConstant: 24),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
}
