//
//  LoginViewController.swift
//  Smartketo
//
//  Created by Pubudu Dilshan on 2023-05-10.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {

    var emailTextfield = UITextField()
    var passwordTextfield = UITextField()
    
    let tohomeButtonfromlogin = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tohomeButtonfromloginsetUp()
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


    func tohomeButtonfromloginsetUp(){

        view.addSubview(tohomeButtonfromlogin)
        tohomeButtonfromlogin.configuration = .filled()
        tohomeButtonfromlogin.configuration?.baseBackgroundColor = .systemRed
        tohomeButtonfromlogin.configuration?.title = "Click to Sign UP"


        tohomeButtonfromlogin.addTarget(self, action: #selector(gotohomefromlo), for: .touchUpInside)
        tohomeButtonfromlogin.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([



            tohomeButtonfromlogin.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            tohomeButtonfromlogin.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant:-50),

            tohomeButtonfromlogin.widthAnchor.constraint(equalToConstant: 200),
            tohomeButtonfromlogin.heightAnchor.constraint(equalToConstant: 50)

        ])


    }
    @objc func gotohomefromlo(){

        
        guard let email = emailTextfield.text else {return}
        guard let password = passwordTextfield.text else {return}
        Auth.auth().signIn(withEmail: email, password: password){ firebaseResult, error in
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
