//
//  SignUpViewController.swift
//  Studio Lamda
//
//  Created by Antonio Flores on 1/9/21.
//

import UIKit
import Firebase
import JGProgressHUD

class SignUpViewController: UIViewController {

    let signUpView = SignUpView()
    
    private let spinner = JGProgressHUD(style: .dark)
    
    var canSignup = false
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        textFieldDelegates()
        signUpView.emailTF.becomeFirstResponder()
        signUpViewConstraints()
        signUpView.alreadyHaveButton.addTarget(self, action: #selector(loginSegue), for: .touchUpInside)
        signUpView.createButton.addTarget(self, action: #selector(segueToMainScreen), for: .touchUpInside)
        spinner.textLabel.text = "Creating Account"

    }
    
    @objc func loginSegue(){
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }

    
    @objc func segueToMainScreen() {

        if signUpView.emailTF.text == "" || signUpView.passwordTF.text == "" {
            alertUser(title: "Email Error", message: "Make sure email is fillout properly")
            self.canSignup = false

            return
        }
        
        
        guard let email = signUpView.emailTF.text, let password = signUpView.passwordTF.text, let name = signUpView.nameTF.text, !email.isEmpty, !password.isEmpty, !name.isEmpty  else {
            alertUser(title:"Forum Error", message: "Make sure everthing is filled out coorectly")
            self.canSignup = false

            return
                }
        
        DatabaseManager.shared.isUserExists(with: email) { (exists) in
            guard  !exists else {
                //USER already exists
                self.canSignup = false
                 return
            }

            
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
                
                guard result != nil, error == nil else {
                    print("Error Creating User")
                    self?.alertUser(title: " Error", message: "Error Creating User Try Again")
                    self!.canSignup = false
                    return
                }
                
                if result != nil  {
                    self!.canSignup = true
                }
                
                
                if self!.canSignup {
                    self!.spinner.show(in: self!.view)
                    let initialProgressBarUpdater = 0
                    let chatUser = ChatAppUser(fullName: name, emailAddress: email, progressBarUpdater: initialProgressBarUpdater)
                    DatabaseManager.shared.insertUser(user: chatUser)
                    let user = result?.user
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
                    self!.spinner.indicatorView = JGProgressHUDSuccessIndicatorView()
                    }
                    self!.spinner.dismiss()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
                    
                        self!.dismiss(animated: true, completion: nil)
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let mainScreen = storyboard.instantiateViewController(withIdentifier: "mainScreen")
                        self?.navigationController?.pushViewController(mainScreen, animated: true)
                    }
                }
                
                

            }
        }
    }
    
    func textFieldDelegates(){
        signUpView.emailTF.delegate = self
        signUpView.nameTF.delegate = self
        signUpView.passwordTF.delegate = self
        signUpView.confirmPasswordTF.delegate = self
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

extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == signUpView.emailTF {
            signUpView.nameTF.becomeFirstResponder()
        }
        
        if textField == signUpView.nameTF {
            signUpView.passwordTF.becomeFirstResponder()
        }
        
        if textField == signUpView.passwordTF {
            signUpView.confirmPasswordTF.becomeFirstResponder()
        }
        
        else if textField == signUpView.confirmPasswordTF {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
}
