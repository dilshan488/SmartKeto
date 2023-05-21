//
//  HomeViewController.swift
//  Smartketo
//
//  Created by Pubudu Dilshan on 2023-05-16.
//

import UIKit

class Homevcs: UIViewController {

    
    
    
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
    
    private let BMIButton: UIButton = {
        
        let bmbutton = UIButton()
        bmbutton.backgroundColor = .systemBlue
        bmbutton.tintColor = .white
        bmbutton.setImage(UIImage(systemName: "pencil"), for: .normal)
        bmbutton.layer.cornerRadius = 40
        bmbutton.layer.shadowColor = UIColor.label.cgColor
        bmbutton.layer.shadowOpacity = 0.4
        bmbutton.layer.shadowRadius = 10
        return bmbutton
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(composeButton)
        composeButton.addTarget(self, action: #selector(didTapcreate), for: .touchUpInside)
        
        view.addSubview(BMIButton)
        BMIButton.addTarget(self, action: #selector(didTapbmical), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        composeButton.frame = CGRect(x: view.frame.width - 80, y: view.frame.height - 88  - view.safeAreaInsets.bottom, width: 80, height: 80)
        
        
        BMIButton.frame = CGRect(x: view.frame.width - 60, y: view.frame.height - 58  - view.safeAreaInsets.bottom, width: 80, height: 80)
    }

    @objc private func didTapcreate(){
        
        let vc = CreateNewPostViewController()
        vc.title = "Create a Workout"
        let navVC = UINavigationController(rootViewController: vc)
        present(navVC, animated: true)
    }
    
    @objc private func didTapbmical(){
        
        let nextScreen = CalculateViewController()
        nextScreen.title = "Calculate BMI"
        navigationController?.pushViewController(nextScreen, animated: true)
        
    }
    
    

}
