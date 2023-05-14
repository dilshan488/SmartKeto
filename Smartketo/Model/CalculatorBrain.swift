//
//  CalculatorBrain.swift
//  Smartketo
//
//  Created by Pubudu Dilshan on 2023-05-14.
//

import UIKit
struct CalculatorBrain
{
    var bmiValue:BMI?
    func getAdvice() -> String
    {
        return bmiValue?.advice ?? "No Advice"
    }
    func getColor() -> UIColor
    {
        return bmiValue?.color ?? UIColor.white
    }
    mutating func calculateBMI(height:Float,weight:Float)
    {
        if height != 0.0
        {
            let bmiVal = weight/(height*height)
            if bmiVal < 18.5
            {
                bmiValue = BMI(value: bmiVal, advice: "Underweight",color: UIColor.init(_colorLiteralRed: 0.0, green: 0.0, blue: 0.65, alpha: 1.0))
            }
            else if bmiVal <= 24.9
            {
                bmiValue = BMI(value: bmiVal, advice: "Normal Weight",color: UIColor.init(_colorLiteralRed: 0.0, green: 0.5, blue: 0, alpha: 1.0))
            }
            else
            {
                bmiValue = BMI(value: bmiVal, advice: "Over Weight",color: UIColor.init(_colorLiteralRed: 0.78, green: 0.0, blue: 0.0, alpha: 1.0))
            }
        }
    }
    func getBMIValue() -> String
    {
        let bmiString = String(format: "%.1f", bmiValue?.value ?? 0.0)
        return bmiString
    }
}
