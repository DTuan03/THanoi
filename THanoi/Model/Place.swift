//
//  Place.swift
//  THanoi
//
//  Created by Tuấn on 11/2/25.
//
import Foundation

struct District {
    let id: String?
    let name: String?
}

struct Place {
    let id: String
    let name: String
    let description: String?
    let districtId: String?
    let address: String?
    let latitude: Double?
    let longitude: Double?
    let category: [String]?
    let avatar: String?
    let images: [String]?
    let avgRating: Float?
    let totalReviews: Int?
    let ownerId: String?
    let ownerName: String?
    let createdAt: Date
}

struct Review {
    let id: String
    let placeId: String?
    let userId: String?
    let rating: Int?
    let comment: String?
    let reported: Bool?
    let reportReason: String?
    let createdAt: Date
}

struct Calendar {
    let id: String
    let placedId: String
    var isVisited: Bool
    let addedDate: String
    let createdAt: String
}

struct Favorite {
    let id: String
    let placedId: String
    let createdAt: String
}

struct Weather {
    let tempMin: String
    let tempMax: String
    let icon: String
}
