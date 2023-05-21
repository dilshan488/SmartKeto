//
//  TabBarViewController.swift
//  Smartketo
//
//  Created by Pubudu Dilshan on 2023-05-17.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        setUpControllers()
    }
    

    private func setUpControllers(){
        guard let currentUserEmail = UserDefaults.standard.string(forKey: "email") else{
            return
        }
        let home = Homevcs()
        home.title = "Home"
        
        let profile = ProfileViewController(currentEmail: currentUserEmail)
        profile.title = "Profile"
        
        let weightgainvc = WeightgainVC()
        weightgainvc.title = "weightvc"
        
        home.navigationItem.largeTitleDisplayMode = .always
        profile.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: home)
        let nav2 = UINavigationController(rootViewController: profile)
        let nav3 = UINavigationController(rootViewController: weightgainvc)
       
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
    
       
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "Dumbell"), tag: 3)
        
        setViewControllers([nav1,nav2,nav3], animated: true)
    }
}
