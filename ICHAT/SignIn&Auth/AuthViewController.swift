//
//  ViewController.swift
//  ICHAT
//
//  Created by Antbook on 23.11.2021.
//

import UIKit

class AuthViewController: UIViewController {
    
    
    
    let logoImageView = UIImageView(image: UIImage(named: "Logo"), contentMode: .scaleAspectFit)
    
    let googleLabel = UILabel(text: "Get started with")
    let emailLabel = UILabel(text: "Or sign up with")
    let onboardLabel = UILabel(text: "Already onboard?")
    
    let googleButton = UIButton(title: "Google", titleColor: .black, backgroundColor: .white, isShadow: true)
    
    let emailButton = UIButton(title: "Email", titleColor: .mainWhite(), backgroundColor: .buttonDark())
    
    let loginButton = UIButton(title: "Login", titleColor: .buttonRed(), backgroundColor: .white, isShadow: true)
    
    let signUpVC = SignUpViewController()
    let loginButtonVC = LoginViewController()
    let mainTabBarVC = MainTabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstrains()
        
       
        googleButton.addTarget(self, action: #selector(googleButtonAction), for: .touchUpInside)
        emailButton.addTarget(self, action: #selector(emailButtonAction), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
    }
    
    
    

    @objc private func googleButtonAction () {
        print("click google")
        present(mainTabBarVC, animated: true, completion: nil)
        
    }
    
    @objc private func emailButtonAction () {
        print("click email")
        present(signUpVC, animated: true, completion: nil)
        
    }
    @objc private func loginButtonAction () {
        print("click login")
        present(loginButtonVC, animated: true, completion: nil)
        
    }




}


extension AuthViewController {
    
    private func setupConstrains () {
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false//activated working with constraint
        
      
        
        let googleView = ButtonWithView(label: googleLabel, button: googleButton)
        let emailView = ButtonWithView(label: emailLabel, button: emailButton)
        let loginView = ButtonWithView(label: onboardLabel, button: loginButton)
        
        
        
        let stackView = UIStackView(arrangedSubviews: [googleView, emailView, loginView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 40
       
        
        view.addSubview(logoImageView)
        view.addSubview(stackView)
        
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 158).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 160).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -142).isActive = true
        
       
        
        
    }
}

import SwiftUI

//add canvas mode
struct AuthViewControllerProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
        
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = AuthViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
    
}

