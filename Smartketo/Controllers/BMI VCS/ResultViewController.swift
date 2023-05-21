//
//  ResultViewController.swift
//  Smartketo
//
//  Created by Pubudu Dilshan on 2023-05-14.
//

import UIKit

class ResultViewController: UIViewController {

    var bmiValue = String()
    var advice = String()
    var color = UIColor()
    var bmiLabel = UILabel(frame:CGRect(x: 0, y: 0, width: 300, height: 20))
    var adviceLabel =  UILabel(frame:CGRect(x: 80, y: 220, width: 300, height: 20))
    override func viewDidLoad()
    {
        super.viewDidLoad()
        bmiLabelsetup()
        
        adviceLabel.text = advice
        view.backgroundColor = color
        
    }
    
    
    func bmiLabelsetup(){
        
        bmiLabel.center = CGPointMake(100, 100)
        bmiLabel.textAlignment = NSTextAlignment.center
        bmiLabel.font = UIFont(name: bmiLabel.font.fontName, size:30)
        bmiLabel.textColor = UIColor.black
        bmiLabel.text = bmiValue
        self.view.addSubview(bmiLabel)
    }
     func recalculateButton(_ sender: UIButton )
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    

 

}
