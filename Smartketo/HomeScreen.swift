//
//  HomeScreen.swift
//  Smartketo
//
//  Created by Pubudu Dilshan on 2023-05-10.
//

import UIKit
import Firebase
import FirebaseDatabase
class HomeScreen: UIViewController {
    
    var ref: DatabaseReference!
    var textField_Names = UITextField()
    let addClick = UIButton()
    var textView_NameList = UITextView()
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        view.backgroundColor = .systemBackground
        
        emailsetup()
        toHomesetUp()
        textView_NameListsetup()
        observeData()
     
       
    }
    

    func emailsetup(){

        self.view.addSubview(textField_Names)
       
        textField_Names.backgroundColor = UIColor.systemRed
       // emailTextfield.borderStyle = .line
        textField_Names.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([



            textField_Names.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            textField_Names.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant:-600),

            textField_Names.widthAnchor.constraint(equalToConstant: 200),
            textField_Names.heightAnchor.constraint(equalToConstant: 50)

        ])
        

    }
    
    
    func  textView_NameListsetup(){

        self.view.addSubview(textView_NameList)
       
        textView_NameList.backgroundColor = UIColor.systemBlue
       // emailTextfield.borderStyle = .line
        textView_NameList.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([



            textView_NameList.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            textView_NameList.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant:-300),

            textView_NameList.widthAnchor.constraint(equalToConstant: 200),
            textView_NameList.heightAnchor.constraint(equalToConstant: 50)

        ])
        

    }
    
    func toHomesetUp(){
        
        view.addSubview(addClick)
        addClick.configuration = .filled()
        addClick.configuration?.baseBackgroundColor = .systemRed
        addClick.configuration?.title = "Click to Home Screen"
        
        
        addClick.addTarget(self, action: #selector(gotoHomeScreen), for: .touchUpInside)
        
        
        
        
        addClick.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
        
            addClick.centerYAnchor.constraint(equalTo:view.centerYAnchor),
            
                addClick.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            
                addClick.widthAnchor.constraint(equalToConstant: 200),
            addClick.heightAnchor.constraint(equalToConstant: 50)
            
        ])
       
  
    }
    
    @objc func gotoHomeScreen(){
        
        if (textField_Names.text != ""){
                
            self.ref.child("MYRTDB").child("users").child(textField_Names.text!).setValue(textField_Names.text)
            textField_Names.text = ""
            }
           
        }
        
    func observeData(){
        self.ref.child("MYRTDB").child("users").observe(.value, with:{(snapshot)
            
            in self.textView_NameList.text = ""
            
            if let oSnapShot = snapshot.children.allObjects as? [DataSnapshot]{
                
                for oSnap in oSnapShot{
                    if let sName = oSnap.value as? String
                    {
                        
                        print("Name: \(sName)")
                        self.textView_NameList.text = self.textView_NameList.text + sName + "\n"
                    }
                    
                }
            }
        })
        
    }
    
        
    }


