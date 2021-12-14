//
//  MUser.swift
//  ICHAT
//
//  Created by Antbook on 14.12.2021.
//

import Foundation

struct MUser: Hashable, Decodable {
    var username: String
    var avatarStringURL : String
    var id : Int
    
   
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    //sorted principe
    static func == (lhs: MUser, rhs: MUser) -> Bool {
        return lhs.id == rhs.id
    }
}
