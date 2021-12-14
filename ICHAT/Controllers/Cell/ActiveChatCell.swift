//
//  ActiveChatCell.swift
//  ICHAT
//
//  Created by Antbook on 29.11.2021.
//

import UIKit



class ActiveChatCell: UICollectionViewCell, SelfConfiguringCell {
 

    static var reuseId: String = "ActiveChatCell"
    
    let friendImageView = UIImageView()
    let friendName = UILabel(text: "User name", font: .laoSangamMN20())
    let lastMessage = UILabel(text: "How are you?", font: .laoSangamMN18())
    var gradientView = GradienView(from: .topTrailing, to: .bottomLeading, startColor: #colorLiteral(red: 0.7882352941, green: 0.631372549, blue: 0.9411764706, alpha: 1), endColor: #colorLiteral(red: 0.4784313725, green: 0.6980392157, blue: 0.9215686275, alpha: 1))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        backgroundColor = .mainWhite()
       
        
        setupConstraints()
        
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
        
    }
    
    
    func configure<U>(with value: U) where U : Hashable {
        guard let user: MChat = value as? MChat else {return}
        friendName.text = user.username
        lastMessage.text = user.lastMessage
        friendImageView.image = UIImage(named: user.userImageString)
    }
    
   


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
}



//MARK: - Setup Constraints
extension ActiveChatCell {
    
    private func setupConstraints () {
        
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        friendName.translatesAutoresizingMaskIntoConstraints = false
        lastMessage.translatesAutoresizingMaskIntoConstraints = false
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        
        friendImageView.backgroundColor = .orange
        addSubview(friendImageView)
        addSubview(friendName)
        addSubview(lastMessage)
        addSubview(gradientView)
        
        NSLayoutConstraint.activate([
            friendImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            friendImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            friendImageView.heightAnchor.constraint(equalToConstant: 78),
            friendImageView.widthAnchor.constraint(equalToConstant: 78),
            
            friendName.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            friendName.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 16),
            friendName.trailingAnchor.constraint(equalTo: gradientView.leadingAnchor, constant: 118),
            
            lastMessage.topAnchor.constraint(equalTo: friendName.bottomAnchor, constant: 9),
            lastMessage.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 16),
            lastMessage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -17),
            
            gradientView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            gradientView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            gradientView.widthAnchor.constraint(equalToConstant: 8),
            gradientView.heightAnchor.constraint(equalToConstant: 78)
            
        ])
    }
    
}

//MARK: - CANVAS MODE to UIKit
import SwiftUI

//add canvas mode
struct ActivChatCellProvider: PreviewProvider {
    
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
        
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = MainTabBarController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
    
}
