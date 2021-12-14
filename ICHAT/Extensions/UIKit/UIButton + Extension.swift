//
//  UIButton + Extension.swift
//  ICHAT
//
//  Created by Antbook on 23.11.2021.
//

import Foundation
import UIKit

extension UIButton {
    
    convenience init(title: String,
                     titleColor: UIColor,
                     backgroundColor: UIColor,
                     font: UIFont? = .avenir20(),  //default font = avenir
                     isShadow: Bool = false,  //default shadow = false
                     cornerRadius: CGFloat = 4) { //default cornerRadius = 4
        self.init(type: .system)//for click button
        
        self.setTitle(title, for: .normal)
        
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = font
        self.layer.cornerRadius = cornerRadius
        
        if isShadow == true {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 4
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
        }
        
    }
    
}
