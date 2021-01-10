//
//  SignUpView.swift
//  Studio Lamda
//
//  Created by Antonio Flores on 1/10/21.
//

import UIKit

class SignUpView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        itemsConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func itemsConstraints() {
         signupConstaints()
         welcomeLabelConstaints()
         emailTFConstaints()
         nameTFConstaints()
         passwordTFConstaints()
         confirmPasswordTFConstaints()
         createButtonConstaints()
         alreadyHaveLabelConstaints()
    }
    
    
    func signupConstaints() {
        addSubview(signupLabel)
        signupLabel.translatesAutoresizingMaskIntoConstraints = false
        signupLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        signupLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        signupLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
    
    func welcomeLabelConstaints() {
        addSubview(welcomeLabel)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.topAnchor.constraint(equalTo: signupLabel.bottomAnchor, constant: 5).isActive = true
        welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        welcomeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
    
    func emailTFConstaints() {
        addSubview(emailTF)
        emailTF.translatesAutoresizingMaskIntoConstraints = false
        emailTF.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 50).isActive = true
        emailTF.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        emailTF.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
    }
    
    func nameTFConstaints() {
        addSubview(nameTF)
        nameTF.translatesAutoresizingMaskIntoConstraints = false
        nameTF.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 30).isActive = true
//        nameTF.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        nameTF.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
        nameTF.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

    }
    
    func passwordTFConstaints() {
        addSubview(passwordTF)
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTF.topAnchor.constraint(equalTo: nameTF.bottomAnchor, constant: 30).isActive = true
        passwordTF.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        passwordTF.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
    }
    
    func confirmPasswordTFConstaints() {
        addSubview(confirmPasswordTF)
        confirmPasswordTF.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordTF.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 30).isActive = true
        confirmPasswordTF.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        confirmPasswordTF.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7).isActive = true
    }
    
    
    func createButtonConstaints() {
        addSubview(createButton)
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.topAnchor.constraint(equalTo: confirmPasswordTF.bottomAnchor, constant: 50).isActive = true
        createButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4).isActive = true
        createButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func alreadyHaveLabelConstaints() {
    addSubview(alreadyHaveButton)
        alreadyHaveButton.translatesAutoresizingMaskIntoConstraints = false
        alreadyHaveButton.topAnchor.constraint(equalTo: createButton.bottomAnchor, constant: 30).isActive = true
        alreadyHaveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        alreadyHaveButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true

        addSubview(alreadyHaveLabel)
        alreadyHaveLabel.translatesAutoresizingMaskIntoConstraints = false
        alreadyHaveLabel.topAnchor.constraint(equalTo: createButton.bottomAnchor, constant: 30).isActive = true
        alreadyHaveLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        alreadyHaveLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    }



lazy var signupLabel: UILabel = {
    var label = UILabel()
    label.text = "Sign Up!"
    label.textColor = .blue
    label.textAlignment = .left
    label.font = UIFont(descriptor: UIFontDescriptor(name: "HelveticaNeue-Medium", size: 8), size: 18)
    label.font = UIFont.boldSystemFont(ofSize: 28)
    return label
}()

lazy var welcomeLabel: UILabel = {
    var label = UILabel()
    label.text = "Start Your Dream Project Today"
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

lazy var nameTF: UITextField = {
    var textField = UITextField()
    textField.placeholder = "   Name"
    textField.setUnderLine(color: .black)
    textField.leftIcon(imageName: "person", tintColor: .black)
    return textField
}()

lazy var passwordTF: UITextField = {
    var textField = UITextField()
    textField.placeholder = "   Password"
    textField.leftIcon(imageName: "lock.fill", tintColor: .black)
    textField.setUnderLine(color: .black)

    return textField
}()

lazy var confirmPasswordTF: UITextField = {
    var textField = UITextField()
    textField.placeholder = "   Confirm Password"
    textField.leftIcon(imageName: "lock", tintColor: .black)
    textField.setUnderLine(color: .black)

    return textField
}()

lazy var createButton: UIButton = {
    var button = UIButton()
    button.setTitle("CREATE", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .blue
    button.layer.cornerRadius = 10
    return button
}()

lazy var alreadyHaveLabel: UILabel = {
    var label = UILabel()
    let alreadyHave = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17), NSAttributedString.Key.foregroundColor : UIColor.black]
    let signup = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17), NSAttributedString.Key.foregroundColor : UIColor.systemBlue]
    let alreadyHaveString = NSMutableAttributedString(string:"Already Have an account?", attributes:alreadyHave)
    let signupString = NSMutableAttributedString(string:" Login", attributes:signup)
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


extension UITextField {
    func setUnderLine(color:UIColor) {
        self.layer.borderColor = color.cgColor
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.borderWidth = 0.0
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
        self.borderStyle = .none
    }
    
    func leftIcon(imageName:String,tintColor:UIColor){
        self.leftView = UIImageView(image:UIImage(systemName: imageName))
        self.leftView?.tintColor = tintColor
        self.leftView?.frame = CGRect(x: 30, y: 30, width: 20 , height:20)
        self.leftViewMode = .always
    }
    
    func rightIcon(imageName:String,tintColor:UIColor){
        self.rightView = UIImageView(image:UIImage(systemName: imageName))
        self.rightView?.tintColor = tintColor
        self.rightView?.frame = CGRect(x: 30, y: 30, width: 20 , height:20)
        self.rightViewMode = .always
    }
    

}
