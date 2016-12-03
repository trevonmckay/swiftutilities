//
//  UIColor+Extensions.swift
//  Swift Utilities
//
//  Created by Tre`Von McKay on 11/12/16.
//

import Foundation
import UIKit

extension UIColor{
    static func from(RGB value: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(value & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    static func from(hex code:String) -> UIColor {
        var cString:String = code.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor.from(RGB: UInt(rgbValue))
    }
}
