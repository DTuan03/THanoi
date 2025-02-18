//
//  ReviewdDataManager.swift
//  THanoi
//
//  Created by Tuấn on 18/2/25.
//

import Foundation
import FirebaseFirestore

class ReviewdDataManager {
    static var shared = ReviewdDataManager()
    private init() {}
    
    var reviews: [Review] = []
    
    func addReview(userId: String, userName: String, placedId: String, avatarUser: String, rating: Int, comment: String, timestamp: String, completion: @escaping (Bool) -> Void) {
        
        FirebaseService.shared.addReview(userId: userId, userName: userName, placedId: placedId, avatarUser: avatarUser, rating: rating, comment: comment, timestamp: timestamp, completion: { error in
            if error {
                print("Them khong thanh cong")
                completion(false)
            } else {
                print("Thanh cong")
                completion(true)
            }
        })
    }
    
    func fetchReview(placeId: String, completion: @escaping (([Review]) -> Void)) {
        
        FirebaseService.shared.fetchReview(placeId: placeId, completion: { reviews in
            self.reviews = reviews
            completion(reviews)
        })
    }
}
