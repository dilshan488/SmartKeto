//
//  mainVc.swift
//  Smartketo
//
//  Created by Pubudu Dilshan on 2023-05-21.
//

import UIKit

class mainVc: UIViewController {
    
    

    
    private let bmibutton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemMint
        button.setTitle("Calculate your BMI", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let browseworkoutbutton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemMint
        button.setTitle("See the Workouts", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let timer: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemMint
        button.setTitle("See the In buuild timer", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(bmibutton)
        view.addSubview(browseworkoutbutton)
        view.addSubview(timer)
        
        
        
        bmibutton.addTarget(self, action: #selector(gotobmiscreen), for: .touchUpInside)
        browseworkoutbutton.addTarget(self, action: #selector(gotoworkoutscreen), for: .touchUpInside)
        timer.addTarget(self, action: #selector(gototimerscreen), for: .touchUpInside)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //headerView.frame = CGRect(x:0, y:view.safeAreaInsets.top,width:view.width, height: view.height/4)
        
        
        bmibutton.frame = CGRect(x: 20, y: view.safeAreaInsets.top, width: view.width - 40, height: 50)
        browseworkoutbutton.frame = CGRect(x: 20, y: bmibutton.bottom, width: view.width - 40, height: 50)
        timer.frame = CGRect(x: 20, y: browseworkoutbutton.bottom, width: view.width - 40, height: 50)
        
    }
    
    @objc func gotobmiscreen(){
   
           let nextScreen = CalculateViewController()
           navigationController?.pushViewController(nextScreen, animated: true)
      }
    
    @objc func gotoworkoutscreen(){
    
           let nextScreen = HomeViewController()
           navigationController?.pushViewController(nextScreen, animated: true)
      }
    
    @objc func gototimerscreen(){
   
           let nextScreen = TimerVc()
           navigationController?.pushViewController(nextScreen, animated: true)
      }
    
    
}
    
