//
//  FavoriteDataManager.swift
//  THanoi
//
//  Created by Tuấn on 18/2/25.
//

import Foundation
import FirebaseFirestore

class FavoriteDataManager {
    static let shared = FavoriteDataManager()
    private init() {}
    
    var favoritePlaceId: [String] = []
    
    func loadFavoritePlaceId(userId: String, completion: @escaping([String]) -> Void) {
        
        FirebaseService.shared.fetchUsers(userId: userId, completion: { data in
            let data = data
            self.favoritePlaceId = data["favorites"] as? [String] ?? []
        })
    }
    
    func updateFavoritePlace(userId: String, placedId: String, completion: @escaping([String]) -> Void) {
        favoritePlaceId.append(placedId)
        FirebaseService.shared.updateFavovite(userId: userId, favoritePlaceId: placedId, completion: { success in
            if success {
                print("Cap nhap thanh cong \(userId) va dia diem \(placedId)")
                completion(self.favoritePlaceId)
            } else {
                print("That bai")
                completion(self.favoritePlaceId)
            }
        })
    }
    
    func deleteFavoritePlace(userId: String, placedId: String, completion: @escaping([String]) -> Void) {
        favoritePlaceId.removeAll { $0 == placedId}
        FirebaseService.shared.deleteFavorite(userId: userId, favoritePlaceId: placedId, completion: { success in
            if success {
                print("Xoa thanh cong dia diem \(placedId) cua \(userId)")
                completion(self.favoritePlaceId)
            } else {
                print("That bai")
                completion(self.favoritePlaceId)
            }
        })
    }
}
