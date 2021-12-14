//
//  ChatRequestViewController.swift
//  ICHAT
//
//  Created by Antbook on 13.12.2021.
//

import UIKit


class ChatRequestViewController: UIViewController {
    
    let containerView = UIView()
    let imageView = UIImageView(image: #imageLiteral(resourceName: "human2"), contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Ronnie McDaniel", font: .systemFont(ofSize: 20, weight: .light))
    let aboutMeLabel = UILabel(text: "You have the opportunity to chat with me!", font: .systemFont(ofSize: 16, weight: .light))
    
    let acceptButton = UIButton(title: "ACCEPT", titleColor: .mainWhite(), backgroundColor: .purple, font: .laoSangamMN20(), isShadow: false, cornerRadius: 10)
    let denyButton = UIButton(title: "Deny", titleColor: #colorLiteral(red: 0.8431372549, green: 0.1921568627, blue: 0.1725490196, alpha: 1), backgroundColor: .mainWhite(), font: .laoSangamMN20(), isShadow: false, cornerRadius: 10)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray
        
        denyButton.layer.cornerRadius = 10
        denyButton.layer.borderWidth = 1.2
        denyButton.layer.borderColor = #colorLiteral(red: 0.8431372549, green: 0.1921568627, blue: 0.1725490196, alpha: 1)
      
        //button.titleColor(for: .normal) = .black
        
       // button.backgroundColor = .red
       
        
        
        
        
        setupConstrains()
        customizeElement()
    }
    
    func customizeElement () {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
        denyButton.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.numberOfLines = 0
        containerView.backgroundColor = .mainWhite()
        containerView.layer.cornerRadius = 30
        
        acceptButton.applyGradients(cornerRadius: 10)
      
        
    }
    
 
}

//MARK: - Setup Constaints
extension ChatRequestViewController {
    
   private func setupConstrains () {
   
    view.addSubview(imageView)
    view.addSubview(containerView)
   
    containerView.addSubview(nameLabel)
    containerView.addSubview(aboutMeLabel)
    containerView.addSubview(acceptButton)
    containerView.addSubview(denyButton)
    
    NSLayoutConstraint.activate([
        
        imageView.topAnchor.constraint(equalTo: view.topAnchor),
        imageView.bottomAnchor.constraint(equalTo: containerView.topAnchor),
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        containerView.heightAnchor.constraint(equalToConstant: 206),
        
        nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 25),
        nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
        nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
        
        aboutMeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
        aboutMeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        aboutMeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        
        acceptButton.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 24),
        acceptButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
        acceptButton.widthAnchor.constraint(equalToConstant: 168),
        acceptButton.heightAnchor.constraint(equalToConstant: 56),
        
        denyButton.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 24),
        denyButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
        denyButton.widthAnchor.constraint(equalToConstant: 168),
        denyButton.heightAnchor.constraint(equalToConstant: 56)
       
    ])
    
    
    
    }
    
}




//MARK: - ADD CANVAS MODE to UIKit
import SwiftUI

//add canvas mode
struct ChatRequestProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
        
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = ChatRequestViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
    
}

