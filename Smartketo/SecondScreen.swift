//
//  SecondScreen.swift
//  Smartketo
//
//  Created by Pubudu Dilshan on 2023-05-09.
//

import UIKit
import Firebase
class SecondScreen: UIViewController {
   var emailTextfield = UITextField()
   var passwordTextfield = UITextField()
    let tohomeButton = UIButton()
    override func viewDidLoad() {
       
        
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        toHomesetUp()
        emailsetup()
        setuppasswordTextfield()
    
    }
    
    
    func emailsetup(){

        self.view.addSubview(emailTextfield)
       
        emailTextfield.backgroundColor = UIColor.systemRed
       // emailTextfield.borderStyle = .line
        emailTextfield.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([



            emailTextfield.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            emailTextfield.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant:-600),

            emailTextfield.widthAnchor.constraint(equalToConstant: 200),
            emailTextfield.heightAnchor.constraint(equalToConstant: 50)

        ])
        

    }
    
    func setuppasswordTextfield(){

        self.view.addSubview(passwordTextfield)
       
        passwordTextfield.backgroundColor = UIColor.systemRed
       // emailTextfield.borderStyle = .line
        passwordTextfield.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([



            passwordTextfield.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            passwordTextfield.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant:-300),

            passwordTextfield.widthAnchor.constraint(equalToConstant: 200),
            passwordTextfield.heightAnchor.constraint(equalToConstant: 50)

        ])
        

    }
    func toHomesetUp(){
        
        view.addSubview(tohomeButton)
        tohomeButton.configuration = .filled()
        tohomeButton.configuration?.baseBackgroundColor = .systemRed
        tohomeButton.configuration?.title = "Click to Home Screen"
        
        
        tohomeButton.addTarget(self, action: #selector(gotoHomeScreen), for: .touchUpInside)
        
        
        
        
        tohomeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
        
            tohomeButton.centerYAnchor.constraint(equalTo:view.centerYAnchor),
            
                tohomeButton.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            
                tohomeButton.widthAnchor.constraint(equalToConstant: 200),
            tohomeButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
       
  
    }
    
    
    @objc func gotoHomeScreen(){
        
        guard let email = emailTextfield.text else {return}
        guard let password = passwordTextfield.text else {return}
        Auth.auth().createUser(withEmail: email, password: password){ firebaseResult, error in
            if let e = error{
                
                print("error")
            }
            else
            {
                let nextScreen = HomeScreen()
                nextScreen.title = " Home Screen"
                self.navigationController?.pushViewController(nextScreen, animated: true)
                
            }
            
            
        }
        
        
    }
    
  

    
    

    }
  

