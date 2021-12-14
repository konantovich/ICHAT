//
//  Label + Extension.swift
//  ICHAT
//
//  Created by Antbook on 23.11.2021.
//

import Foundation
import UIKit


extension UILabel {
    
    convenience init(text: String) { //default cornerRadius = 4
        self.init()
        
        self.text = text
        
    }
    
}
