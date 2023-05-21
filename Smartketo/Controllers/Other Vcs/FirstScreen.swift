//
//  ViewController.swift
//  Smartketo
//
//  Created by Pubudu Dilshan on 2023-05-06.
//

import UIKit

class FirstScreen: UIViewController {

    let loginButton = UIButton()

    let signUpbutton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonlogin()
        setupButtonsignUp()
        view.backgroundColor = .systemBackground
        title = "Login Screen"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    func setupButtonlogin(){

        view.addSubview(loginButton)
        loginButton.configuration = .filled()
        loginButton.configuration?.baseBackgroundColor = .systemRed
        loginButton.configuration?.title = "Click to Login"
        loginButton.addTarget(self, action: #selector(gotohomefromlogin), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([


            loginButton.centerYAnchor.constraint(equalTo:view.centerYAnchor),

                loginButton.centerXAnchor.constraint(equalTo:view.centerXAnchor),

                loginButton.widthAnchor.constraint(equalToConstant: 200),
            loginButton.heightAnchor.constraint(equalToConstant: 50)

        ])


    }




    @objc func gotohomefromlogin(){

        let nextScreen = LoginViewController()
        navigationController?.pushViewController(nextScreen, animated: true)
   }




    func setupButtonsignUp(){

        view.addSubview(signUpbutton)
        signUpbutton.configuration = .filled()
        signUpbutton.configuration?.baseBackgroundColor = .systemRed
        signUpbutton.configuration?.title = "Click to Sign UP"


        signUpbutton.addTarget(self, action: #selector(gotoNextScreen), for: .touchUpInside)
        signUpbutton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([



                signUpbutton.centerXAnchor.constraint(equalTo:view.centerXAnchor),
                signUpbutton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant:-50),

                signUpbutton.widthAnchor.constraint(equalToConstant: 200),
            signUpbutton.heightAnchor.constraint(equalToConstant: 50)

        ])


    }
    @objc func gotoNextScreen(){

        let nextScreen = SecondScreen()
        nextScreen.title = " Signup Screen"
        navigationController?.pushViewController(nextScreen, animated: true)
    }


}

