//
//  SectionHeader.swift
//  ICHAT
//
//  Created by Antbook on 29.11.2021.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    
    static let reuseId = "SectionHeader"
    
    var title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        addSubview(title)
        
        NSLayoutConstraint.activate([
        title.topAnchor.constraint(equalTo: self.topAnchor),
        title.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        title.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        title.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
    }
    
    func configure (title: String, font: UIFont?, textColor: UIColor?) {
        self.title.text = title
        self.title.font = font
        self.title.textColor = textColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
