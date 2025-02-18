//
//  UserManager.swift
//  THanoi
//
//  Created by Tuấn on 16/2/25.
//

import FirebaseFirestore

class UserManager {
    static let shared = UserManager()
    private let db = Firestore.firestore()
    
    var user: UserModel!
    
    func saveUserData(userId: String, name: String, email: String, completion: @escaping (Bool, String?) -> Void) {
        let userData: [String: Any] = [
            "userId": userId,
            "name": name,
            "email": email,
            "phone": "",
            "avatar": "",
            "favorites": [],
            "calendars": [[
                "placeId": "",
                "scheduledDate": "",
                "isVisited": false
            ]]
        ]
        
        db.collection("users").document(userId).setData(userData) { error in
            if let error = error {
                completion(false, error.localizedDescription)
            } else {
                completion(true, nil)
            }
        }
        
    }
    
    func featchUser(userId: String, completion: @escaping ((UserModel) -> Void)) {
        FirebaseService.shared.fetchUsers(userId: userId, completion: { document in
            let document = document
            let userId = document["userId"] as? String ?? ""
            let name = document["name"] as? String ?? "Người dùng THanoi"
            let email = document["email"] as? String ?? "email@example"
            let phone = document["phone"] as? String ?? "0000000"
            let avatar = document["avatar"] as? String ?? ""
            
            self.user = UserModel(userId: userId, name: name, email: email, phone: phone, avatar: avatar)
            
            completion(self.user)
        })
    }
}
