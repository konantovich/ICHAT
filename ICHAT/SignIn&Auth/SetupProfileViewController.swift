//
//  SetupProfileViewController.swift
//  ICHAT
//
//  Created by Antbook on 25.11.2021.
//

import UIKit


class SetupProfileViewController : UIViewController {
    
    
    let welcomeLabel = UILabel(text: "Set up profile", font: .avenir26())
    
    let userPhotoImageView = addPhotoView()
    
    let nameLabel = UILabel(text: "Full Name")
    let aboutLabel = UILabel(text: "About me")
    let fullNameTextField = OneLineTextField(font: .avenir20())
    let aboutMeTextField = OneLineTextField(font: .avenir20())
    
    let gender = UILabel(text: "Gender")
    let genderSegmentControl = UISegmentedControl(first: "Male", second: "Femail")
    
    let goToChatsButton = UIButton(title: "Go to chats!", titleColor: .white, backgroundColor: .buttonDark(), cornerRadius: 4)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupConstraints()
        
    }
    
    
    
}


extension SetupProfileViewController {
    
    private func setupConstraints () {
        
        userPhotoImageView.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        goToChatsButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        view.addSubview(userPhotoImageView)
        view.addSubview(welcomeLabel)
        
        //welcome label and user photo
        NSLayoutConstraint.activate([ //auto .isActivate for all constraints
            
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      //      welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            
            userPhotoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userPhotoImageView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 40),
            
        ])
        
        let fullNameStackView = UIStackView(arrangedSubviews: [
        nameLabel, fullNameTextField], axis: .vertical, spacing: 0)
        let aboutMeStackView = UIStackView(arrangedSubviews: [aboutLabel, aboutMeTextField], axis: .vertical, spacing: 0)
        let genderStackView = UIStackView(arrangedSubviews: [gender, genderSegmentControl], axis: .vertical, spacing: 0)
        
        let allStackViews = UIStackView(arrangedSubviews: [fullNameStackView,
                                                           aboutMeStackView,
                                                           genderStackView,
                                                           goToChatsButton
        ], axis: .vertical, spacing: 40)
        
        allStackViews.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(allStackViews)
        
        NSLayoutConstraint.activate([ //auto .isActivate for all constraints
            
            allStackViews.topAnchor.constraint(equalTo: userPhotoImageView.bottomAnchor, constant: 60),
            allStackViews.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            allStackViews.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            allStackViews.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120)
            
        ])
        
    }
}



import SwiftUI

//add canvas mode
struct SetupProfileProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
        
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = SetupProfileViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
    
}
