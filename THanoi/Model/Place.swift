//
//  Place.swift
//  THanoi
//
//  Created by Tuấn on 11/2/25.
//
import Foundation

struct Place {
    let id: String
    let name: String
    let description: String?
    let district: String?
    let latitude: Double?
    let longitude: Double?
    let category: String?
    let avatar: String?
    let images: [String]?
    let avgRating: Float?
    let totalReviews: Int?
    let ownerId: String?
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
