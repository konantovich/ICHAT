//
//  ButtonWithView.swift
//  ICHAT
//
//  Created by Antbook on 23.11.2021.
//

import UIKit


//add manual stackView for label and button
class ButtonWithView: UIView {
    init (label: UILabel, button: UIButton) {
        super.init(frame: .zero)
        
        //auto enable constraint and add subviews
        self.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(label)
        self.addSubview(button)
        
        NSLayoutConstraint.activate([ //auto .isActivate for all constraints
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 60),//standart height size button
            
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
     
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
