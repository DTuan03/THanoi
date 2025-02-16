//
//  AuthManager.swift
//  THanoi
//
//  Created by Tuấn on 16/2/25.
//

import Foundation
import FirebaseAuth

class AuthManager {
    static let shared = AuthManager()
    
    func registerUser(email: String, password: String, completion: @escaping (Bool, String?, String?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(false, error.localizedDescription, nil)
                return
            }
            
            if let userId = result?.user.uid {
                completion(true, nil, userId)
            } else {
                completion(false, nil, "Không lấy được userId")
            }
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping (Bool, String?, String) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(false, error.localizedDescription, "")
                return
            }
            if let userId = result?.user.uid {
                completion(true, nil, userId)
            }
        }
    }
}
