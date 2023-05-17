//
//  SignInViewController.swift
//  Smartketo
//
//  Created by Pubudu Dilshan on 2023-05-17.
//

import UIKit

class SignInViewController: UITabBarController {
//headerview
    
    private let headerView = SignInHeaderView()
//
    private let emailfield: UITextField = {
       let field = UITextField()
        field.keyboardType = .emailAddress
        field.leftView = UIView(frame: CGRect(x:0, y:0,width:10, height: 50))
        field.leftViewMode = .always
        field.placeholder = "Email Address"
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.backgroundColor = .secondarySystemBackground
        field.layer.masksToBounds = true
        return field
    }()
    
    //
    private let passwordField: UITextField = {
    let field = UITextField()
     field.leftView = UIView(frame: CGRect(x:0, y:0,width:10, height: 50))
        field.leftViewMode = .always
     field.placeholder = "Password"
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.isSecureTextEntry = true
     field.backgroundColor = .secondarySystemBackground
     field.layer.masksToBounds = true
     return field
 }()
 //sign in button
    private let signInbutton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    
        //create acc button
       private let createAccountbutton: UIButton = {
           let button = UIButton()
           button.setTitle("create Account", for: .normal)
           button.setTitleColor(.link, for: .normal)
           return button
       }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign In"
        view.backgroundColor = .systemBackground
        view.addSubview(headerView)
        view.addSubview(emailfield)
        view.addSubview(passwordField)
        view.addSubview(signInbutton)
        view.addSubview(createAccountbutton)
        
      signInbutton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        createAccountbutton.addTarget(self, action: #selector(didCreateAccount), for: .touchUpInside)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        headerView.frame = CGRect(x:0, y:view.safeAreaInsets.top,width:view.width, height: view.height/4)
        emailfield.frame = CGRect(x: 20, y: headerView.bottom+40, width: view.width - 40, height: 50)
       
        passwordField.frame = CGRect(x: 20, y: emailfield.bottom, width: view.width - 40, height: 50)
        
        signInbutton.frame = CGRect(x: 20, y: passwordField.bottom, width: view.width - 40, height: 50)
        
        createAccountbutton.frame = CGRect(x: 20, y: signInbutton.bottom+40, width: view.width - 40, height: 50)
        
    }
    @objc func didTapSignIn(){
        guard let email = emailfield.text, !email.isEmpty, let password = passwordField.text, !password.isEmpty else {
            return
        }
        AuthManager.shared.signIn(email: email, password: password){[weak self] success in
            guard success else {
                return
            }
            DispatchQueue.main.async {
               // let vc = TabBarViewController()
                UserDefaults.standard.set(email, forKey: "email")
                let nextScreen = TabBarViewController()
                self?.present(nextScreen, animated: true)
//                            tabBarController?.pushViewController(nextScreen, animated: true)
                
            }
        }
    }
    @objc func didCreateAccount(){
//        let vc = SignUpViewController()
//        vc.title = "Create Account"
//        navigationController?.pushViewController(vc, animated: true)
        
        let nextScreen = SignUpViewController()
        nextScreen.title = " Signup Screen"
        navigationController?.pushViewController(nextScreen, animated: true)
    }

}
