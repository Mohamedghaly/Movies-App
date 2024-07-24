//
//  UIView+ Ex.swift
//  iOSTask
//
//  Created by Mohamed Ghaly on 24/07/2024.
//

import UIKit

extension UIView {
    // MARK: - Corner Radius
    @IBInspectable var cornerRadius: CGFloat {
         get {
             return layer.cornerRadius
         }
         set {
             layer.cornerRadius = newValue
         }
     }
    
    func drawShadow() {
        self.layer.shadowRadius = 4
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: -1)
    }
    func removeShadow() {
        self.layer.shadowRadius = 0
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOpacity = 0
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}
