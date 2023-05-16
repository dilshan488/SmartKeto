//
//  Extension+NUmbers.swift
//  Smartketo
//
//  Created by Pubudu Dilshan on 2023-05-15.
//

import Foundation

extension NSObject {
    
    func numberFormat(_ mynumber: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let formattedNumber = numberFormatter.string(from: NSNumber(value: mynumber)) else { return "0.0" }
        return formattedNumber
    }
}
