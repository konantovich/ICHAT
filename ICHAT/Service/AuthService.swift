//
//  AuthService.swift
//  ICHAT
//
//  Created by Antbook on 14.12.2021.
//

import UIKit
import Firebase
import FirebaseAuth


class AuthService {
    
    static let shared = AuthService()
    private let auth = Auth.auth()
    
    func createUser (email: String?, password: String?, confirmPassword: String?, completion: @escaping (Result<User, Error>)->(Void) ) {
        
        guard let email = email, let password = password, let confirmPassword = confirmPassword else { return }
        
        auth.createUser(withEmail: email, password: password) { authResult, error in
            
            if error != nil {
                completion(.failure(error!))
                return
            }
            
            completion(.success(authResult!.user))
            
            
        }
        
    }
    
    
    func loginUser(email: String?, password: String?, completion: @escaping (Result<User, Error>)->(Void) ) {
        
        
        guard let email = email, let password = password else { return }
        
        auth.signIn(withEmail: email, password: password) { result, error  in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            
            completion(.success(result.user))
        }
        
    }
    
}
