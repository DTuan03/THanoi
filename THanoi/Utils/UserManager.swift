//
//  UserManager.swift
//  THanoi
//
//  Created by Tuấn on 16/2/25.
//

//struct UserModel: Codable {
//    let userId: String
//    let name: String
//    let email: String
//    let phone: String?
//    let avatar: String?
//    let favoritePlaces: [String]?
//    let calendarPlaces: [String]?
//}

import FirebaseFirestore

class UserManager {
    static let shared = UserManager()
    private let db = Firestore.firestore()
    
    func saveUserData(userId: String, name: String, email: String,completion: @escaping (Bool, String?) -> Void) {
        let userData: [String: Any] = [
            "userId": userId,
            "name": name,
            "email": email
        ]
        
        db.collection("users").document(userId).setData(userData) { error in
            if let error = error {
                completion(false, error.localizedDescription)
            } else {
                completion(true, nil)
            }
        }
        
    }
}
