//
//  CalculateViewController.swift
//  Smartketo
//
//  Created by Pubudu Dilshan on 2023-05-14.
//

import UIKit

class CalculateViewController: UIViewController {
    
    //var bmiValue="0.0"
    var calculatorBrain = CalculatorBrain()
    
    var heightLabel = UILabel(frame:CGRect(x: 10, y: 100, width: 300, height: 20))
    var weightLabel = UILabel(frame:CGRect(x: 50, y: 220, width: 300, height: 20))
    var heightSlider = UISlider(frame:CGRect(x: 10, y: 100, width: 300, height: 20))
    var weightSlider = UISlider(frame:CGRect(x: 10, y: 200, width: 300, height: 20))
    let calculatebmi = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightSlidersetup()
        weightSliderChangedsetup()
        heightLabelsetup()
        weightLabelsetup()
        tocalculatebmi()
        
    }
    
    func heightSlidersetup(){
        heightSlider.minimumValue = 0
        heightSlider.maximumValue = 10
        heightSlider.isContinuous = true
        heightSlider.tintColor = UIColor.blue
        heightSlider.addTarget(self, action: #selector(self.heightSliderChanged(_:)), for: .valueChanged)
  // heightLabel.text = "\(heightSlider.value)"
        self.view.addSubview(heightSlider)
    }
    
    func weightSliderChangedsetup(){
        weightSlider.minimumValue = 0
       weightSlider.maximumValue = 200
        weightSlider.isContinuous = true
        weightSlider.tintColor = UIColor.blue
        weightSlider.addTarget(self, action: #selector(self.weightSliderChanged(_:)), for: .valueChanged)
  // heightLabel.text = "\(heightSlider.value)"
        self.view.addSubview(weightSlider)
    }
    
    
    func heightLabelsetup(){
        
        
      //  heightLabel = UILabel(frame:CGRect(x: 10, y: 100, width: 300, height: 20))
        heightLabel.center = CGPointMake(190, 61)
        heightLabel.textAlignment = NSTextAlignment.center
        heightLabel.font = UIFont(name: heightLabel.font.fontName, size:10)
        heightLabel.textColor = UIColor.blue
        self.view.addSubview(heightLabel)
        
    }
    
    
    func weightLabelsetup(){
        
        
      //  heightLabel = UILabel(frame:CGRect(x: 10, y: 100, width: 300, height: 20))
        weightLabel.center = CGPointMake(250, 61)
        weightLabel.textAlignment = NSTextAlignment.center
        weightLabel.font = UIFont(name: weightLabel.font.fontName, size:10)
        weightLabel.textColor = UIColor.blue
      
        self.view.addSubview(weightLabel)
        
    }
    
    
     @objc func weightSliderChanged(_ sender: UISlider)
        {
            self.view.addSubview(weightSlider)
            weightLabel.text=String(format: "%.0fKg",sender.value)
            //print(Int(sender.value))
        }
        
        
        
        
       @objc func heightSliderChanged(_ sender: UISlider)
        
        {   heightLabel.text=String(format: "%.2fm",sender.value)
            //print(String(format: "%.2f",sender.value))
        }
    func tocalculatebmi(){
        
        view.addSubview(calculatebmi)
        calculatebmi.configuration = .filled()
        calculatebmi.configuration?.baseBackgroundColor = .systemRed
        calculatebmi.configuration?.title = "Click to BMI"
        
        
        calculatebmi.addTarget(self, action: #selector(calculatePressed), for: .touchUpInside)
        
        
        
        
        calculatebmi.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
        
            calculatebmi.centerYAnchor.constraint(equalTo:view.centerYAnchor),
            
            calculatebmi.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            
            calculatebmi.widthAnchor.constraint(equalToConstant: 200),
            calculatebmi.heightAnchor.constraint(equalToConstant: 50)
            
        ])
       
  
    }
    
        @objc  func calculatePressed(_ sender: UIButton)
    {
        let height=heightSlider.value
        let weight=weightSlider.value
        //let bmi=weight/(height*height)
        //bmiValue=String(format: "%.2f", bmi)
        calculatorBrain.calculateBMI(height:height,weight:weight)
        
        //self.performSegue(withIdentifier: "goToResult", sender: self)
        
        //        let secondVC=SecondViewController()
        //        secondVC.bmiValue = String(format : "%.1f",bmi)
        //        self.present(secondVC, animated: true, completion: nil)
        let nextScreen = ResultViewController()
        nextScreen.title = "ResultView"
        nextScreen.bmiValue=calculatorBrain.getBMIValue()
        nextScreen.advice=calculatorBrain.getAdvice()
        nextScreen.color=calculatorBrain.getColor()
        self.navigationController?.pushViewController(nextScreen, animated: true)
        
    }
    
//        override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//        {
//            if segue.identifier == "goToResult"
//            {
//                let destinationVC = segue.destination as! ResultViewController
//                destinationVC.bmiValue=calculatorBrain.getBMIValue()
//                destinationVC.advice=calculatorBrain.getAdvice()
//                destinationVC.color=calculatorBrain.getColor()
//            }
//        }
    }

