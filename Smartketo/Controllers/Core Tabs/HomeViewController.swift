//
//  HomeViewController.swift
//  Smartketo
//
//  Created by Pubudu Dilshan on 2023-05-16.
//

import UIKit

class HomeViewController: UIViewController {

    
    
    
    private let composeButton: UIButton = {
        
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.tintColor = .white
        button.setImage(UIImage(systemName: "pencil"), for: .normal)
        button.layer.cornerRadius = 40
        button.layer.shadowColor = UIColor.label.cgColor
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 10
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(composeButton)
        composeButton.addTarget(self, action: #selector(didTapcreate), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        composeButton.frame = CGRect(x: view.frame.width - 80 - 16 , y: view.frame.height - 80 - 16 - view.safeAreaInsets.bottom, width: 80, height: 80)
    }

    @objc private func didTapcreate(){
        
        let vc = CreateNewPostViewController()
        vc.title = "Create Post"
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
    }
    
    

}
