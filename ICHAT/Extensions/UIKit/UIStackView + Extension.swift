//
//  UIStackView + Extension.swift
//  ICHAT
//
//  Created by Antbook on 25.11.2021.
//

import UIKit


extension UIStackView {
    
    convenience init (arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        
        self.axis = axis
        self.spacing = spacing
        
    }
    
}
