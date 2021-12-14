//
//  addPhotoView.swift
//  ICHAT
//
//  Created by Antbook on 25.11.2021.
//

import UIKit

class AddPhotoView: UIView {
    
    let userImage : UIImageView = {
       var image = UIImageView()
 
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = #imageLiteral(resourceName: "avatar")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.borderWidth = 1

        return image
    }()
    
    let addUserImageButton : UIButton = {

        let userImageButton = UIButton(type: .system)
        userImageButton.translatesAutoresizingMaskIntoConstraints = false
        userImageButton.setImage(#imageLiteral(resourceName: "plus"), for: .normal)
        userImageButton.tintColor = .buttonDark()
        
        return userImageButton
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(userImage)
        addSubview(addUserImageButton)
    
        setupConstrains()
        
    }
    
    
    
   private func setupConstrains () {
        
       
    NSLayoutConstraint.activate([ //auto .isActivate for all constraints
        
    userImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
    userImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
    userImage.widthAnchor.constraint(equalToConstant:  100),
    userImage.heightAnchor.constraint(equalToConstant: 100),
   
    
  
    addUserImageButton.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 16),
    addUserImageButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        addUserImageButton.widthAnchor.constraint(equalToConstant:  30),
        addUserImageButton.heightAnchor.constraint(equalToConstant: 30)
  
        ])
    
    self.bottomAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 0).isActive = true
    self.trailingAnchor.constraint(equalTo: addUserImageButton.trailingAnchor, constant: 0).isActive = true
    }
    
    
    //active when changed view (up screen or rotate iphone frome user etc)
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        userImage.layer.masksToBounds = true
        userImage.layer.cornerRadius = userImage.frame.width / 2
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
