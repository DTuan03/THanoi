//
//  FirebaseService.swift
//  THanoi
//
//  Created by Tuấn on 17/2/25.
//

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
    
    
    
}
