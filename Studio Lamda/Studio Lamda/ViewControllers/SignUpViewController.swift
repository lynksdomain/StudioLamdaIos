//
//  SignUpViewController.swift
//  Studio Lamda
//
//  Created by Antonio Flores on 1/9/21.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    let signUpView = SignUpView()
    
//    var ref: DatabaseReference!

    
//    let firebaseAuth = FirebaseAuth
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        textFieldDelegates()
        signUpView.emailTF.becomeFirstResponder()
        signUpViewConstraints()
        signUpView.alreadyHaveButton.addTarget(self, action: #selector(loginSegue), for: .touchUpInside)
        signUpView.createButton.addTarget(self, action: #selector(segueToMainScreen), for: .touchUpInside)
    }
    
    @objc func loginSegue(){
        
//        guard let email = signUpView.emailTF.text,let password = signUpView.passwordTF.text else {
//            print("Form not Valid")
//            return
//        }
//
//        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
//            if error != nil {
//                print(error)
//                return
//            }
//
//            ref = Database.database().ref

            
//        }
        
        
        dismiss(animated: true, completion: nil)
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }

    @objc func segueToMainScreen() {
        
        if signUpView.emailTF.text == "" || signUpView.passwordTF.text == "" {
            alertUser(title: "Email Erro", message: "Make sure email is fillout properly")
            return
        }
        
        
        guard let email = signUpView.emailTF.text, let password = signUpView.passwordTF.text, let name = signUpView.nameTF.text, !email.isEmpty, !password.isEmpty, !name.isEmpty  else {
            alertUser(title:"Forum Error", message: "Make sure everthing is filled out coorectly")
            return
                }
        
        DatabaseManager.shared.isUserExists(with: email) { (exists) in
            guard  !exists else {
                //USER already exists
                
                 return
            }
            
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
                guard result != nil, error == nil else {
                    print("Error Creating User")
                    self?.alertUser(title: "User Error", message: "Error Creating User")
                    return
                }
                let chatUser = ChatAppUser(firstName: name, lasttName: "Last", emailAddress: email)
                DatabaseManager.shared.insertUser(user: chatUser)
                let user = result?.user
            }
        }
        
       
        
        
        dismiss(animated: true, completion: nil)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainScreen = storyboard.instantiateViewController(withIdentifier: "mainScreen")
        self.navigationController?.pushViewController(mainScreen, animated: true)
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
