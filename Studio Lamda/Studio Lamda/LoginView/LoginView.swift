//
//  LoginView.swift
//  Studio Lamda
//
//  Created by Antonio Flores on 1/10/21.
//

import UIKit

class LoginView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        itemsConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func itemsConstraints() {
         loginConstaints()
         welcomeLabelConstaints()
         emailTFConstaints()
         passwordTFConstaints()
         createButtonConstaints()
         alreadyHaveLabelConstaints()
    }
    
    
    func loginConstaints() {
        addSubview(loginLabel)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        loginLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        loginLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
    
    func welcomeLabelConstaints() {
        addSubview(welcomeLabel)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 5).isActive = true
        welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
    
    func emailTFConstaints() {
        addSubview(emailTF)
        emailTF.translatesAutoresizingMaskIntoConstraints = false
        emailTF.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 60).isActive = true
        emailTF.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        emailTF.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
    }

    
    func passwordTFConstaints() {
        addSubview(passwordTF)
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 60).isActive = true
        passwordTF.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        passwordTF.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
    }
    
    
    func createButtonConstaints() {
        addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 50).isActive = true
        loginButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func alreadyHaveLabelConstaints() {
    addSubview(alreadyHaveButton)
        alreadyHaveButton.translatesAutoresizingMaskIntoConstraints = false
        alreadyHaveButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30).isActive = true
        alreadyHaveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        alreadyHaveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true

        addSubview(alreadyHaveLabel)
        alreadyHaveLabel.translatesAutoresizingMaskIntoConstraints = false
        alreadyHaveLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 30).isActive = true
        alreadyHaveLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        alreadyHaveLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    }



lazy var loginLabel: UILabel = {
    var label = UILabel()
    label.text = "Welcome Back"
    label.textColor = .blue
    label.textAlignment = .left
    label.font = UIFont(descriptor: UIFontDescriptor(name: "HelveticaNeue-Medium", size: 8), size: 18)
    label.font = UIFont.boldSystemFont(ofSize: 28)
    return label
}()

lazy var welcomeLabel: UILabel = {
    var label = UILabel()
    label.text = "See how your project is doing"
    label.textColor = .black
    label.textAlignment = .center
    label.font = UIFont(descriptor: UIFontDescriptor(name: "HelveticaNeue-Medium", size: 8), size: 18)
    label.font = UIFont.boldSystemFont(ofSize: 24)

    return label
}()


lazy var emailTF: UITextField = {
    var textField = UITextField()
    textField.placeholder = "   Email"
    textField.leftIcon(imageName: "envelope", tintColor: .black)
    textField.setUnderLine(color: .black)

    return textField
}()


lazy var passwordTF: UITextField = {
    var textField = UITextField()
    textField.placeholder = "   Password"
    textField.leftIcon(imageName: "lock.fill", tintColor: .black)
    textField.setUnderLine(color: .black)

    return textField
}()


lazy var loginButton: UIButton = {
    var button = UIButton()
    button.setTitle("LOGIN", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .blue
    button.layer.cornerRadius = 10
    return button
}()

lazy var alreadyHaveLabel: UILabel = {
    var label = UILabel()
    let alreadyHave = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17), NSAttributedString.Key.foregroundColor : UIColor.black]
    let signup = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17), NSAttributedString.Key.foregroundColor : UIColor.systemBlue]
    let alreadyHaveString = NSMutableAttributedString(string:"Dont Have an Account?", attributes:alreadyHave)
    let signupString = NSMutableAttributedString(string:" Sign Up", attributes:signup)
    alreadyHaveString.append(signupString)
    label.attributedText = alreadyHaveString
    label.tintColor = .black
    label.font = UIFont(name: "Open Sans", size: 14) //Montserrat
    label.textAlignment = .left
    label.font = UIFont.boldSystemFont(ofSize: 17)
    label.numberOfLines = 0
    label.textAlignment = .center
    return label
}()
    
    lazy var alreadyHaveButton: UIButton = {
        var button = UIButton()
        return button
    }()
    
}
