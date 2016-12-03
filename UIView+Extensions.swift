//
//  UIView+Extensions.swift
//  Swift Utilities
//
//  Created by Tre`Von McKay on 11/8/16.
//

import Foundation
import UIKit
import QuartzCore

extension UIView{
    
    func setCornerRadius(_ radius:CGFloat) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
    }
    
    func setRounded(_ rounded:Bool) {
        let originalFrame = self.frame
        let originalWidth = originalFrame.size.width
        let originalHeight = originalFrame.size.height
        
        let origin = originalFrame.origin
        
        var newSize:CGSize = CGSize(width: originalWidth, height: originalHeight)
        if originalWidth > originalHeight {
            newSize = CGSize(width: originalHeight, height: originalHeight)
        }
        else if originalHeight > originalWidth{
            newSize = CGSize(width: originalWidth, height: originalWidth)
        }
        
        let newFrame = CGRect(origin: origin, size: newSize)
        self.frame = newFrame
        
        let radius = newFrame.size.height / 2.0
        
        self.setCornerRadius(radius)
    }
    
}
