//
//  MChat.swift
//  ICHAT
//
//  Created by Antbook on 13.12.2021.
//

import Foundation


struct MChat: Hashable, Decodable {
    var username: String
    var userImageString: String
    var lastMessage: String
    var id : Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func contains(filter: String?) -> Bool {
        guard let filter = filter else {return true}
        if filter.isEmpty {return true}
        let lowerCasedFilter = filter.lowercased()
        return username.lowercased().contains(lowerCasedFilter)
    }
    
    //sorted principe
    static func == (lhs: MChat, rhs: MChat) -> Bool {
        return lhs.id == rhs.id
    }
}
 
