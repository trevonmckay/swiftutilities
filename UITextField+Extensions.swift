//
//  UITextfield+Extensions.swift
//  Swift Utilities
//
//  Created by Tre`Von McKay on 7/14/16.
//

import Foundation
import UIKit

extension UITextField{
    func isEmpty() -> Bool{
        return (self.text == nil || self.text?.isEmpty == true)
    }
    
    fileprivate func _setBorder(_ name: String, frame: CGRect, color: UIColor, width: CGFloat){
        let layers = self.layer.sublayers;
        
        let border = CALayer();
        border.name = name;
        border.borderColor = color.cgColor;
        border.frame = frame;
        border.borderWidth = width;
        
        var unique = true;
        var modified = false;
        if(layers != nil)
        {
            for layer in layers!
            {
                if(layer.name == name)
                {
                    unique = false;
                    if(layer.borderColor != border.borderColor
                        || !layer.frame.equalTo(border.frame)
                        || layer.borderWidth != border.borderWidth){
                        modified = true;
                        layer.removeFromSuperlayer();
                    }
                }
            }
        }
        
        if(unique || modified){
            self.layer.addSublayer(border);
            self.layer.masksToBounds = true;
        }
    }
    
    func setLeftBorder(_ color: UIColor, width: CGFloat){
        let frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height);
        _setBorder("border_left", frame: frame, color: color, width: width);
    }
    
    func setTopBorder(_ color: UIColor, width: CGFloat){
        let frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width);
        _setBorder("border_top", frame: frame, color: color, width: width);
    }
    
    func setBottomBorder(_ color: UIColor, width: CGFloat){
        let layers = self.layer.sublayers;
        
        let border = CALayer();
        border.name = "border_bottom";
        border.borderColor = color.cgColor;
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width);
        border.borderWidth = width;
        
        var unique = true;
        var modified = false;
        if(layers != nil)
        {
            for layer in layers!
            {
                if(layer.name == "border_bottom")
                {
                    unique = false;
                    if(layer.borderColor != border.borderColor
                        || !layer.frame.equalTo(border.frame)
                        || layer.borderWidth != border.borderWidth){
                        modified = true;
                        layer.removeFromSuperlayer();
                    }
                }
            }
        }
        
        if(unique || modified){
            self.layer.addSublayer(border);
            self.layer.masksToBounds = true;
        }
    }
    
    func setRightBorder(_ color: UIColor, width: CGFloat){
        let layers = self.layer.sublayers;
        
        let border = CALayer();
        border.name = "border_right";
        border.borderColor = color.cgColor;
        border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: self.frame.size.width, height: self.frame.size.height);
        border.borderWidth = width;
        
        var unique = true;
        var modified = false;
        if(layers != nil)
        {
            for layer in layers!
            {
                if(layer.name == "border_right")
                {
                    unique = false;
                    if(layer.borderColor != border.borderColor
                        || !layer.frame.equalTo(border.frame)
                        || layer.borderWidth != border.borderWidth){
                        modified = true;
                        layer.removeFromSuperlayer();
                    }
                }
            }
        }
        
        if(unique || modified){
            self.layer.addSublayer(border);
            self.layer.masksToBounds = true;
        }
    }
}
