//
//  LoginViewController.swift
//  Studio Lamda
//
//  Created by Antonio Flores on 1/9/21.
//

import UIKit

class LoginViewController: UIViewController {

    let loginView = LoginView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        signUpViewConstraints()
        LoginView.loginButton.addTarget(self, action: #selector(loginSegue), for: .touchUpInside)
    }
    

    @objc func loginSegue(){
        dismiss(animated: true, completion: nil)
        var signupVC = SignUpViewController()
        navigationController?.pushViewController(signupVC, animated: true)
    }

    func signUpViewConstraints() {
        view.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
  

}
