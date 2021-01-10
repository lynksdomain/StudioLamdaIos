//
//  LoginStartScreenView.swift
//  Studio Lamda
//
//  Created by Antonio Flores on 1/9/21.
//

import UIKit

class LoginStartScreenView: UIView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
     itemsConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func itemsConstraints(){
        backgroundImageConstraints()
        titleConstraints()
        loginConstraints()
        signUpButtonConstraints()
    }
    
    
    func backgroundImageConstraints(){
        addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func titleConstraints(){
        addSubview(studioLabel)
        addSubview(lamdaLabel)
        
        studioLabel.translatesAutoresizingMaskIntoConstraints = false
        lamdaLabel.translatesAutoresizingMaskIntoConstraints = false
        
        studioLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 130).isActive = true
        studioLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 22).isActive = true
        studioLabel.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true

        lamdaLabel.topAnchor.constraint(equalTo: studioLabel.bottomAnchor).isActive = true
        lamdaLabel.leadingAnchor.constraint(equalTo: studioLabel.trailingAnchor,constant: 0).isActive = true
        lamdaLabel.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2).isActive = true
    }
    
    func loginConstraints(){
        addSubview(LoginButton)
        LoginButton.translatesAutoresizingMaskIntoConstraints = false
        LoginButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.06).isActive = true
        LoginButton.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        LoginButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        LoginButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func signUpButtonConstraints(){
        addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.055).isActive = true
        signUpButton.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        signUpButton.topAnchor.constraint(equalTo: LoginButton.bottomAnchor, constant: 40).isActive = true

    }
    
    
    lazy var backgroundImage: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "test2")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var studioLabel: UILabel = {
        var label = UILabel()
        label.text = "STUDIO"
        label.textColor = .white
        label.font = UIFont(descriptor: UIFontDescriptor(name: "HelveticaNeue-Medium", size: 8), size: 18)
        label.font = UIFont.boldSystemFont(ofSize: 43)
        return label
    }()
    
    lazy var lamdaLabel: UILabel = {
        var label = UILabel()
        label.text = "LAMDA"
        label.textColor = .white
        label.font = UIFont(descriptor: UIFontDescriptor(name: "HelveticaNeue-Medium", size: 8), size: 18)
        label.font = UIFont.boldSystemFont(ofSize: 43)
        return label
    }()
    
    
    lazy var LoginButton: UIButton = {
        var button = UIButton()
        button.setTitle("LOGIN", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 16
        return button
    }()
    
    
    
    lazy var signUpButton: UIButton = {
        var button = UIButton()
        button.setTitle("SIGNUP", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        return button
    }()
}
