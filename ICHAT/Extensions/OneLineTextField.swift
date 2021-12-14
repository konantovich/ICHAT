//
//  TextField + Extension.swift
//  ICHAT
//
//  Created by Antbook on 25.11.2021.
//

import UIKit


class OneLineTextField: UITextField {
    
    convenience init (font: UIFont? = .avenir20()) {
        self.init()
        
        self.font = font
        self.borderStyle = .none
        self.translatesAutoresizingMaskIntoConstraints = false
        
        
        //add line with 1 height frame
        var lineForTextField = UIView()
        lineForTextField = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        lineForTextField.backgroundColor = .textFieldLight()
        lineForTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(lineForTextField)
        
        NSLayoutConstraint.activate([
            
            //grey line in textField
            lineForTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            lineForTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lineForTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            lineForTextField.heightAnchor.constraint(equalToConstant: 1)
            
            
            
            
            
        ])
        
      
        
    }
    

    
}
