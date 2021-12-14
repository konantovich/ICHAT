//
//  SelfConfigurationCell.swift
//  ICHAT
//
//  Created by Antbook on 29.11.2021.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure(withValue: MChat)
}
