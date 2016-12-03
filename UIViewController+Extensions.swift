//
//  UIViewController+Extensions.swift
//  Swift Utilities
//
//  Created by Tre`Von McKay on 11/10/16.
//

import Foundation
import UIKit

extension UIViewController{
    func presentActivityIndicator() {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        let screenSize = UIScreen.main.bounds
        
        delegate.progressWindow = UIWindow(frame: screenSize)
        delegate.progressWindow!.windowLevel = UIWindowLevelAlert
        
        let overlayView = UIView(frame: screenSize)
        overlayView.backgroundColor = UIColor.darkGray
        overlayView.alpha = 0.6
        
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.center = overlayView.center
        
        overlayView.addSubview(activityIndicator)
        delegate.progressWindow!.addSubview(overlayView)
        
        DispatchQueue.main.async {
            delegate.progressWindow!.isHidden = false
            activityIndicator.startAnimating()
        }
    }
    
    func dismissActivityIndicator(){
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
        DispatchQueue.main.async {
            if delegate.progressWindow != nil{
                delegate.progressWindow!.isHidden = true
            }
        }
    }
    
    func dismissKeyboardOnTap(_ selector: Selector) {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: selector)
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func traverseAndFindClass<T : UIViewController>() -> T? {
        var currentViewController = self
        while let parentViewController = currentViewController.parent {
            if let result = parentViewController as? T {
                return result
            }
            currentViewController = parentViewController
        }
        return nil
    }
}
