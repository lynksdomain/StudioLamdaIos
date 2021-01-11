//
//  LoginViewController.swift
//  Studio Lamda
//
//  Created by Antonio Flores on 1/9/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    let loginView = LoginView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        signUpViewConstraints()
        loginView.alreadyHaveButton.addTarget(self, action: #selector(loginSegue), for: .touchUpInside)
        loginView.loginButton.addTarget(self, action: #selector(segueToMainScreen), for: .touchUpInside)
    }
    
    
    @objc func segueToMainScreen() {
        
        guard let email = loginView.emailTF.text, let password = loginView.passwordTF.text, !email.isEmpty, !password.isEmpty, password.count >= 6 else {
            print("Error logging in user")
            return
        }
        
        Firebase.Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            guard let result = user, error == nil else {
                print("Error can't find user")
                return
            }
            
            let user = result.user
        }
        
        dismiss(animated: true, completion: nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainScreen = storyboard.instantiateViewController(withIdentifier: "mainScreen")
        self.navigationController?.pushViewController(mainScreen, animated: true)
    }

    @objc func loginSegue(){
        dismiss(animated: true, completion: nil)
        let signupVC = SignUpViewController()
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
