//
//  WaitingChatCell.swift
//  ICHAT
//
//  Created by Antbook on 29.11.2021.
//

import UIKit


class WaitingChatCell: UICollectionViewCell, SelfConfiguringCell{

 
    
    
    static var reuseId: String = "WaitingChatCell"
    
    let newFriendImageView = UIImageView()
    
    func configure<U>(with value: U) where U : Hashable {
        guard let user: MChat = value as? MChat else {return}
        newFriendImageView.image = UIImage(named: user.userImageString)
        
       
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        backgroundColor = .mainWhite()
       
        setupConstraint()
        
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension WaitingChatCell {
    
    private func setupConstraint () {
        
        newFriendImageView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(newFriendImageView)
        
        newFriendImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        newFriendImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        newFriendImageView.widthAnchor.constraint(equalToConstant: 88).isActive = true
        newFriendImageView.heightAnchor.constraint(equalToConstant: 88).isActive = true
        
        
    }
    
    
}


//MARK: - ADD CANVAS MODE to UIKit
import SwiftUI

//add canvas mode
struct ActivWaitingChatCellProvider: PreviewProvider {
    
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
