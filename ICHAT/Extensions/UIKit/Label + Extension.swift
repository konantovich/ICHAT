//
//  Label + Extension.swift
//  ICHAT
//
//  Created by Antbook on 23.11.2021.
//

import UIKit


extension UILabel {
    
    convenience init(text: String, font: UIFont? = .avenir20()) { //default cornerRadius = 4
        self.init()
        
        self.text = text
        self.font = font
        
    }
    
}
