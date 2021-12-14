//
//  UIImageView + Extension.swift
//  ICHAT
//
//  Created by Antbook on 23.11.2021.
//

import UIKit


extension UIImageView {
    
    convenience init(image: UIImage?, contentMode: UIView.ContentMode) {
        
        self.init ()
        
        self.image = image
        self.contentMode = contentMode
        
    }
 
}


extension UIImageView {
    
    //change color for picture
    func setupColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}
