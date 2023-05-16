//
//  ProfileViewController.swift
//  Smartketo
//
//  Created by Pubudu Dilshan on 2023-05-16.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title:"SignOut", style: .done, target: self, action: #selector(didTapSignOut))
       
    }
    
   @objc private func didTapSignOut(){
        
        
    }
    
}
