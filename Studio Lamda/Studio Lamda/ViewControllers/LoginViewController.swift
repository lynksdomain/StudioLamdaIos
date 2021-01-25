//
//  LoginViewController.swift
//  Studio Lamda
//
//  Created by Antonio Flores on 1/9/21.
//

import UIKit
import Firebase
import JGProgressHUD

class LoginViewController: UIViewController {

    let loginView = LoginView()
    private let spinner = JGProgressHUD(style: .dark)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        signUpViewConstraints()
        loginView.alreadyHaveButton.addTarget(self, action: #selector(loginSegue), for: .touchUpInside)
        
        loginView.loginButton.addTarget(self, action: #selector(segueToMainScreen), for: .touchUpInside)
        spinner.textLabel.text = "Logging In"
    }
    
    
    @objc func segueToMainScreen() {
        
        guard let email = loginView.emailTF.text, let password = loginView.passwordTF.text, !email.isEmpty, !password.isEmpty, password.count >= 6 else {
            print("Error logging in user")
            self.alertUser(title: "Error", message: "Can't be blank")
            return
        }
        
        Firebase.Auth.auth().signIn(withEmail: email, password: password) { [self] (user, error) in
            guard let result = user, error == nil else {
                alertUser(title: "Login error", message: "Email or Password might be Incorrect")
                return
            }
            
            self.spinner.show(in: self.view)

            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {

            self.dismiss(animated: true, completion: nil)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainScreen = storyboard.instantiateViewController(withIdentifier: "mainScreen")
            self.navigationController?.pushViewController(mainScreen, animated: true)
            let user = result.user
            }
        }
        
    }

    @objc func loginSegue(){
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
