//
//  UserDetailscapturingViewController.swift
//  Smartketo
//
//  Created by Pubudu Dilshan on 2023-05-19.
//

import UIKit

class UserDetailscapturingViewController: UIViewController {

    private let HeightTextfield: UITextField = {
       let field = UITextField()
        field.leftView = UIView(frame: CGRect(x:0, y:0,width:10, height: 50))
        field.leftViewMode = .always
        field.placeholder = "Enter Height"
        field.autocapitalizationType = .words
        field.autocorrectionType = .yes
        field.layer.masksToBounds = true
        return field
    }()
    
    private let WeightTextfield: UITextField = {
       let field = UITextField()
        field.leftView = UIView(frame: CGRect(x:0, y:0,width:10, height: 50))
        field.leftViewMode = .always
        field.placeholder = "Enter Weight"
        field.autocapitalizationType = .words
        field.autocorrectionType = .yes
        field.layer.masksToBounds = true
        return field
    }()
    
    private let ageTextfield: UITextField = {
       let field = UITextField()
        field.leftView = UIView(frame: CGRect(x:0, y:0,width:10, height: 50))
        field.leftViewMode = .always
        field.placeholder = "Enter Age"
        field.autocapitalizationType = .words
        field.autocorrectionType = .yes
        field.layer.masksToBounds = true
        return field
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        view.addSubview(HeightTextfield)
        view.addSubview(WeightTextfield)
        view.addSubview(ageTextfield)
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        HeightTextfield.frame = CGRect(x: 10, y: view.safeAreaInsets.top, width: view.width - 20, height: 50)
        WeightTextfield.frame = CGRect(x: 0, y: HeightTextfield.bottom+5, width: view.width, height: 160)
        ageTextfield.frame = CGRect(x: 10, y: HeightTextfield.bottom+10, width: view.width-20, height: view.height-210-view.safeAreaInsets.top)
        
    }
    
    

   
}
