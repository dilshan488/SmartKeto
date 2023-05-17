//
//  SignUpViewController.swift
//  Smartketo
//
//  Created by Pubudu Dilshan on 2023-05-17.
//

import UIKit

class SignUpViewController: UITabBarController {

    //headerview
        
        private let headerView = SignInHeaderView()
    //
    
    private let namefield: UITextField = {
       let field = UITextField()
        field.leftView = UIView(frame: CGRect(x:0, y:0,width:10, height: 50))
        field.leftViewMode = .always
        field.placeholder = "Full name"
        field.backgroundColor = .secondarySystemBackground
        field.layer.masksToBounds = true
        return field
    }()

        private let emailfield: UITextField = {
           let field = UITextField()
            field.keyboardType = .emailAddress
            field.autocapitalizationType = .none
            field.autocorrectionType = .no
            field.leftView = UIView(frame: CGRect(x:0, y:0,width:10, height: 50))
            field.leftViewMode = .always
            field.placeholder = "Email Address"
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
        private let signUpbutton: UIButton = {
            let button = UIButton()
            button.backgroundColor = .systemMint
            button.setTitle("create Account", for: .normal)
            button.setTitleColor(.white, for: .normal)
            return button
        }()
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            title = "Create account"
            view.backgroundColor = .systemBackground
            view.addSubview(headerView)
            view.addSubview(namefield)
            view.addSubview(emailfield)
            view.addSubview(passwordField)
            view.addSubview(signUpbutton)
            
            
            signUpbutton.addTarget(self, action: #selector(didTapSignup), for: .touchUpInside)
       
            
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            headerView.frame = CGRect(x:0, y:view.safeAreaInsets.top,width:view.width, height: view.height/4)
            namefield.frame = CGRect(x: 20, y: headerView.bottom, width: view.width - 40, height: 50)
            emailfield.frame = CGRect(x: 20, y: namefield.bottom+10, width: view.width - 40, height: 50)
           
            passwordField.frame = CGRect(x: 20, y: emailfield.bottom, width: view.width - 40, height: 50)
            
            signUpbutton.frame = CGRect(x: 20, y: passwordField.bottom, width: view.width - 40, height: 50)
                    
        }
        @objc func didTapSignup(){
            guard let email = emailfield.text, !email.isEmpty,
                  let password = passwordField.text, !password.isEmpty,
                  let name = namefield.text, !name.isEmpty else{
                return
                }
            //create user
            AuthManager.shared.signUp(email: email, password: password) {[weak self]success in
                if success{
                    //update databse
                    let newUser = User(name: name, email: email, profilePictureRef: nil)
                    DatabaseManager.shared.inser(user: newUser){
                        inserted in
                        guard inserted else{
                            return
                        }
                        UserDefaults.standard.set(email, forKey: "email")
                        UserDefaults.standard.set(name, forKey: "name")
                        DispatchQueue.main.async {
                           // let vc = TabBarViewController()
                            let nextScreen = TabBarViewController()
                            self?.present(nextScreen, animated: true)
//                            tabBarController?.pushViewController(nextScreen, animated: true)
                            
                        }
                    }
                    
                }
                else{
                    
                    print("Faild to create")
                }
                
                
            }
            //update databse
        }
     
    }
