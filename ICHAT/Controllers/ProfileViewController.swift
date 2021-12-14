//
//  ProfileViewController.swift
//  ICHAT
//
//  Created by Antbook on 02.12.2021.
//

import UIKit


class ProfileViewController: UIViewController {
    
    let containerView = UIView()
    let imageView = UIImageView(image: #imageLiteral(resourceName: "human6"), contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Peter Ben", font: .systemFont(ofSize: 20, weight: .light))
    let aboutMeLabel = UILabel(text: "You have the opportunity to chat with me!", font: .systemFont(ofSize: 16, weight: .light))
    
    let myTextField = InsertableTextFiled()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray
        
        customizeElement ()
        setupConstrains()
    }
    
    func customizeElement () {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        myTextField.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.numberOfLines = 0
        containerView.backgroundColor = .mainWhite()
        containerView.layer.cornerRadius = 30
        myTextField.backgroundColor = .mainWhite()
        myTextField.layer.cornerRadius = 18
      //  myTextField.borderStyle = .roundedRect
        
        if let button = myTextField.rightView as? UIButton  {
            button.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        }
        
    }
    
    @objc private func actionButton () {
        print("click right button")
    }
    
    
}


//MARK: - Setup Constaints
extension ProfileViewController {
    
   private func setupConstrains () {
   
    view.addSubview(imageView)
    view.addSubview(containerView)
    containerView.addSubview(nameLabel)
    containerView.addSubview(aboutMeLabel)
    containerView.addSubview(myTextField)
    
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
       
        myTextField.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 20),
        myTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        myTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        myTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -56),
        myTextField.heightAnchor.constraint(equalToConstant: 48)
        
    ])
    
    
    
    }
    
}




//MARK: - ADD CANVAS MODE to UIKit
import SwiftUI

//add canvas mode
struct ProfileProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
        
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = ProfileViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
    
}

