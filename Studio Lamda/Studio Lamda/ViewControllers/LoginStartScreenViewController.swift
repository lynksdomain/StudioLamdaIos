//
//  LoginStartScreenViewController.swift
//  Studio Lamda
//
//  Created by Antonio Flores on 1/9/21.
//

import UIKit

class LoginStartScreenViewController: UIViewController {
    
    let loginStartView = LoginStartScreenView()

    override func viewDidLoad() {
        super.viewDidLoad()
        loginStartViewConstraints()
        loginStartView.LoginButton.addTarget(self, action: #selector(segueToLogin), for: .touchUpInside)
        loginStartView.signUpButton.addTarget(self, action: #selector(segueToSignUp), for: .touchUpInside)
    }
    
    
    @objc func segueToLogin() {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @objc func segueToSignUp() {
        let signupVC = SignUpViewController()
        navigationController?.pushViewController(signupVC, animated: true)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func loginStartViewConstraints() {
        view.addSubview(loginStartView)
        loginStartView.translatesAutoresizingMaskIntoConstraints = false
        loginStartView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        loginStartView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        loginStartView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        loginStartView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    

}
