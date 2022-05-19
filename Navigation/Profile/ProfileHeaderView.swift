//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Evgenii Zhuravlev on 18.05.2022.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {

    //аватар профиля
    let profileImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 16, y: 16, width: 150, height: 150))
        image.backgroundColor = .white
        image.image = UIImage(named: "profileImage")
        image.layer.cornerRadius = 75
        image.clipsToBounds = true
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        return image
    }()

    //имя профиля
    let profileLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 200, y: 27, width: 200, height: 18))
        label.text = "Profile Name"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.black
        return label
    }()

    //кнопка show status
    let statusButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 16, y: 16+150+16, width: UIScreen.main.bounds.width-32, height: 50))
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
        print(statusText.text ?? "no status text")
    }

    //текст статуса
    let statusText: UITextView = {
        let textView = UITextView(frame: CGRect(x: 200, y: 16+150+16-34-30, width: 200, height: 30))
        textView.text = "Status message..."
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.textColor = UIColor.gray
        textView.backgroundColor = UIColor.lightGray
        return textView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(profileImage)
        addSubview(profileLabel)
        addSubview(statusButton)
        addSubview(statusText)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

