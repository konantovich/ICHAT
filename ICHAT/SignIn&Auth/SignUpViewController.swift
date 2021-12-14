//
//  SignUpViewController.swift
//  ICHAT
//
//  Created by Antbook on 25.11.2021.
//

import UIKit




class SignUpViewController: UIViewController {
    
    
    let welcomeLabel = UILabel(text: "Good to see you!", font: .avenir26())
    
    
    let emailLabel = UILabel(text: "Email")
    let passwordLabel = UILabel(text: "Password")
    let confirmPasswordLabel = UILabel(text: "Confirm password")
    let onboardLabel = UILabel(text: "Already onboard?")
    
    let emailTextField = OneLineTextField(font: .avenir20())
    let passwordTextField = OneLineTextField(font: .avenir20())
    let confirmPasswordTextField = OneLineTextField(font: .avenir20())
    
    
    
    
    let signUpButton = UIButton(title: "Sign up", titleColor: .white, backgroundColor: .buttonDark(), cornerRadius: 4)
    
    let loginButton : UIButton = {

        let loginButton = UIButton(type: .system)
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.buttonRed(), for: .normal)
        loginButton.titleLabel?.font = .avenir20()
        
        return loginButton
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
       
        onboardLabel.font = .avenir20()
        
        setupConstraints()

        
    }
    
}

//MARK: - Setup constraints
extension SignUpViewController {
    
    private func setupConstraints () {
        
        
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField], axis: .vertical, spacing: 10)
        
        
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField], axis: .vertical, spacing: 10)
        
        
        let confirmPasswordStackView = UIStackView(arrangedSubviews: [confirmPasswordLabel, confirmPasswordTextField], axis: .vertical, spacing: 10)
        
        
        
        
        signUpButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let allTextView = UIStackView(arrangedSubviews: [emailStackView,
                                                         passwordStackView,
                                                         confirmPasswordStackView,
                                                         signUpButton])
        allTextView.axis = .vertical
        allTextView.spacing = 40
        allTextView.translatesAutoresizingMaskIntoConstraints = false
        
        loginButton.contentHorizontalAlignment = .leading
        let bottomStackView = UIStackView(arrangedSubviews: [onboardLabel, loginButton])
        bottomStackView.axis = .horizontal
        bottomStackView.spacing = 10
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.alignment = .firstBaseline
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(allTextView)
        view.addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            allTextView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 62),
            allTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            allTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            bottomStackView.topAnchor.constraint(equalTo: allTextView.bottomAnchor, constant: 160),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
            
            
            
        ])
    }
    
    
}


import SwiftUI

//add canvas mode
struct SignUpProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
        
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = SignUpViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
    
}
