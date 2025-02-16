//
//  PlaceDataManager.swift
//  THanoi
//
//  Created by Tuấn on 16/2/25.
//

import Foundation
import FirebaseFirestore

class PlaceDataManager {
    static let shared = PlaceDataManager()
    private init() {}
    
    var places: [PlaceModel] = []
    
    func loadPlaces(completion: @escaping () -> Void) {
        FirebaseService.shared.fetchPlaces { locations in
            self.places = locations
            completion()
        }
    }
}



