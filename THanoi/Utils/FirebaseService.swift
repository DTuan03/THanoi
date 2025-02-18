//
//  FirebaseService.swift
//  THanoi
//
//  Created by Tuấn on 17/2/25.
//

import Foundation
import FirebaseFirestore

class FirebaseService {
    static let shared = FirebaseService()
    private let db = Firestore.firestore()
    
    func fetchPlaces(completion: @escaping ([PlaceModel]) -> Void) {
        db.collection("places").getDocuments { result, error in
            guard let documents = result?.documents, error == nil else {
                completion([])
                return
            }
            
            let places = documents.compactMap { doc -> PlaceModel? in
                let data = doc.data()
                
                var latitude: Double = 0.0
                var longitude: Double = 0.0
                if let coordinates = data["coordinates"] as? [Double], coordinates.count == 2 {
                    latitude = coordinates[0]
                    longitude = coordinates[1]
                }
                return PlaceModel(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "Unknown",
                    description: data["description"] as? String ?? "No description",
                    districtId: data["districtId"] as? String ?? "",
                    address: data["address"] as? String ?? "",
                    latitude: latitude,
                    longitude: longitude,
                    category: data["category"] as? [String],
                    avatar: data["avatar"] as? String ?? "",
                    images: data["images"] as? [String] ?? [],
                    avgRating: data["avgRating"] as? Float,
                    totalReviews: data["totalReviews"] as? Int ?? 0,
                    ownerId: data["ownerId"] as? String ?? "",
                    ownerName: data["ownerName"] as? String ?? ""
                )
            }
            completion(places)
        }
    }
    
    func updateFavovite(userId: String, favoritePlaceId: String, completion: @escaping (Bool) -> Void) {
        let ref = db.collection("users").document(userId)
        ref.updateData(["favorites": FieldValue.arrayUnion([favoritePlaceId])]) { error in
            if let error = error {
                print("Ối rồi ôi, lỗi rồi: \(error)")
                completion(false)
            } else {
                completion(true)
            }
        }
    }
    
    func deleteFavorite(userId: String, favoritePlaceId: String, completion: @escaping (Bool) -> Void) {
        let ref = db.collection("users").document(userId)
        ref.updateData(["favorites": FieldValue.arrayRemove([favoritePlaceId])]) { error in
            if let error = error {
                print("Ối rồi ôi, lỗi rồi: \(error)")
                completion(false)
            } else {
                completion(true)
            }
        }
    }
    
    func fetchUsers(userId: String, completion: @escaping ([String : Any]) -> Void) {
        db.collection("users").document(userId).getDocument { document, error in
            guard let document = document, document.exists, error == nil else {
                completion([:])
                return
            }
            
            let data = document.data() ?? [:]
            
            completion(data)
        }
    }
    
    func addCalendar(userId: String, calendar: [String: Any], completion: @escaping (Bool) -> Void) {
       let ref = db.collection("users").document(userId)
        ref.updateData(["calendars": FieldValue.arrayUnion([calendar])]) { error in
            if let error = error {
                print("Ối rồi ôi, lỗi rồi: \(error)")
                completion(false)
            } else {
                completion(true)
            }
        }
    }
    

    
    func addReview(userId: String, userName: String, placedId: String, avatarUser: String, rating: Int, comment: String, timestamp: String, completion: @escaping (Bool) -> Void) {
        let reviewData: [String: Any] = [
            "userId": userId,
            "userName": userName,
            "placedId": placedId,
            "avatarUser": avatarUser,
            "rating": avatarUser,
            "comment": comment,
            "timestamp": timestamp
        ]
        db.collection("reviews").document(placedId).collection("reiviews").addDocument(data: reviewData) { error in
            if let error = error {
                completion(false)
            } else {
                completion(true)
            }
        }
    }
    
    func fetchReview(placeId: String, completion: @escaping ([Review]) -> Void) {
        db.collection("reviews").document(placeId).collection("reviews").getDocuments { document, error in
            if let error = error {
                print("Loi: \(error.localizedDescription)")
                completion([])
            } else {
                var reviews: [Review] = []
                for document in document!.documents {
                    let data = document.data()
                    let userName = data["userName"] as? String ?? "Người dùng THanoi"
                    let avatarUser = data["avatarUser"] as? String ?? ""
                    let rating = data["rating"] as? Int ?? 0
                    let comment = data["comment"] as? String ?? ""
                    let timestamp = data["timestamp"] as? String ?? ""
                    
                    let review = Review(userName: userName, avatarUser: avatarUser, rating: rating, comment: comment, timestamp: timestamp)
                    reviews.append(review)
                }
                completion(reviews)
            }
        }
    }
}
