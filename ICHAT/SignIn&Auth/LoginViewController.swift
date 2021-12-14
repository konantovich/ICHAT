//
//  LoginViewController.swift
//  ICHAT
//
//  Created by Antbook on 25.11.2021.
//

import UIKit


class LoginViewController: UIViewController {
        
    
    let welcomeLabel = UILabel(text: "Welcome Back!", font: .avenir26())
    
    let loginGoogleLabel = UILabel(text: "Login with")
    let orLabel = UILabel(text: "or")
    let emailLabel = UILabel(text: "Email")
    let passwordLabel = UILabel(text: "Password")
    
    let loginGoogleButton = UIButton(title: "Google", titleColor: .black, backgroundColor: .white, isShadow: true)
    
    let emailTextField = OneLineTextField(font: .avenir20())
    let passwordTextField = OneLineTextField(font: .avenir20())
    
    let loginButton = UIButton(title: "Login", titleColor: .white, backgroundColor: .buttonDark(), cornerRadius: 4)
    
    let onboardLabel = UILabel(text: "Need an account?")
    let signUpButton = UIButton()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        signUpButton.setTitle("Sign up", for: .normal)
        signUpButton.setTitleColor(.red, for: .normal)
        
        loginButton.titleLabel?.font = .avenir20()
        loginGoogleButton.setImage(#imageLiteral(resourceName: "googleLogo"), for: .normal)
        loginGoogleButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 253)

        
        
        onboardLabel.font = .avenir20()
        
        
        
        setupConstraints()
        
        
    }
    
    
    
    
}

//MARK: - Setup constraints
extension LoginViewController {
    
    private func setupConstraints () {
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        loginGoogleButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let googleStackView = UIStackView(arrangedSubviews: [loginGoogleLabel, loginGoogleButton], axis: .vertical, spacing: 20)
        
        
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel, emailTextField], axis: .vertical, spacing: 10)
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel, passwordTextField], axis: .vertical, spacing: 10)
        
        let allStackViews = UIStackView(arrangedSubviews: [googleStackView,
                                                           orLabel,
                                                           emailStackView,
                                                           passwordStackView,
                                                           loginButton])
        allStackViews.spacing = 40
        allStackViews.axis = .vertical
        allStackViews.translatesAutoresizingMaskIntoConstraints = false
        
       
        let bottomStackView = UIStackView(arrangedSubviews: [onboardLabel, signUpButton])
        bottomStackView.alignment = .firstBaseline
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.spacing = 10
        
        view.addSubview(welcomeLabel)
        view.addSubview(allStackViews)
        view.addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
        
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
            allStackViews.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 60),
            allStackViews.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            allStackViews.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            bottomStackView.topAnchor.constraint(equalTo: allStackViews.bottomAnchor, constant: 40),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
            
        ])
        
        
        
        
        
    }
}

import SwiftUI

//add canvas mode
struct LoginProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
        
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = LoginViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
    
}

