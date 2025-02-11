//
//  User.swift
//  THanoi
//
//  Created by Tuấn on 16/12/24.
//

import Foundation

struct UserModel {
    let userId: String
    let name: String
    let email: String
    let phone: String?
    let avatar: String?
    let favoritePlaces: [String]?
    let reviews: [String]?
    let calendarPlaces: [String]?
    let createdAt: Date
}
