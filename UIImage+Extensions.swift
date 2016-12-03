//
//  UIImage+Extensions.swift
//  Swift Utilities
//
//  Created by Tre`Von McKay on 11/4/16.
//

import Foundation
import UIKit

extension UIImage{
    
    static func scaleImage(_ image:UIImage, width:CGFloat, height:CGFloat) -> UIImage{
        let scaleSize = CGSize(width: width, height: height)
        
        UIGraphicsBeginImageContextWithOptions(scaleSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: scaleSize.height, height: scaleSize.width))
        let scaledImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return scaledImage
    }
    
    func scaledTo(_ targetSize: CGSize) -> UIImage {
        let size = self.size
        
        let widthRatio  = targetSize.width  / self.size.width
        let heightRatio = targetSize.height / self.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.main.scale)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    func scaled(byHeight maxHeight:CGFloat) -> UIImage {
        let originalWidth  = self.size.width
        let originalHeight = self.size.height
        
        let newWidth = (originalWidth * maxHeight) / originalHeight
        
        return self.scaledTo(CGSize(width: newWidth, height: maxHeight))
    }
    
    func scaled(byWidth maxWidth:CGFloat) -> UIImage {
        let originalWidth  = self.size.width
        let originalHeight = self.size.height
        
        let newHeight = (originalHeight * maxWidth) / originalWidth
        
        return self.scaledTo(CGSize(width: maxWidth, height: newHeight))
    }
}
