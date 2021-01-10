//
//  SignUpViewController.swift
//  Studio Lamda
//
//  Created by Antonio Flores on 1/9/21.
//

import UIKit

class SignUpViewController: UIViewController {

    let signUpView = SignUpView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        signUpViewConstraints()
        signUpView.alreadyHaveButton.addTarget(self, action: #selector(loginSegue), for: .touchUpInside)
    }
    
    @objc func loginSegue(){
        dismiss(animated: true, completion: nil)
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }

    func signUpViewConstraints() {
        view.addSubview(signUpView)
        signUpView.translatesAutoresizingMaskIntoConstraints = false
        signUpView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        signUpView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        signUpView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        signUpView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

}
