//
//  PeopleChatCell.swift
//  ICHAT
//
//  Created by Antbook on 30.11.2021.
//

import UIKit


class PeopleChatCell: UICollectionViewCell, SelfConfiguringCell {
 

    static var reuseId: String = "PeopleChatCell"
    
    let friendImageView = UIImageView()
    let friendName = UILabel(text: "User name", font: .laoSangamMN20())

    func configure<U>(with value: U) where U : Hashable {
        guard let user: MUser = value as? MUser else {return}
        friendImageView.image = UIImage(named: user.avatarStringURL)
        friendName.text = user.username
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        //backgroundColor = .yellow
       
        setupConstraint()
        
        self.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.8
        self.layer.shadowOffset = CGSize(width: 10, height: 10)
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
        friendImageView.layer.cornerRadius = 4
        friendImageView.clipsToBounds = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension PeopleChatCell {
    
    private func setupConstraint () {
        
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        friendName.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(friendName)
        addSubview(friendImageView)
        
        friendImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        friendImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        friendImageView.widthAnchor.constraint(equalToConstant: 183).isActive = true
        friendImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        friendName.topAnchor.constraint(equalTo: friendImageView.bottomAnchor, constant: 10).isActive = true
        friendName.leadingAnchor.constraint(equalTo: friendImageView.leadingAnchor, constant: 8).isActive = true
        
        
    }
    
    
}


//MARK: - ADD CANVAS MODE to UIKit
import SwiftUI

//add canvas mode
struct PeopleChatCellProvider: PreviewProvider {
    
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



