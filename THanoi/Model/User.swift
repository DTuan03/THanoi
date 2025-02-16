//
//  User.swift
//  THanoi
//
//  Created by Tuấn on 16/12/24.
//

import Foundation

struct UserModel: Codable {
    let userId: String
    let name: String
    let email: String
    let phone: String?
    let avatar: String?
    let favoritePlaces: [String]?
    let calendarPlaces: [String]?
}

let users: [UserModel] = [
    UserModel(
        userId: "user_001",
        name: "Nguyễn Văn A",
        email: "nguyenvana@example.com",
        phone: "0987654321",
        avatar: "https://ik.imagekit.io/tvlk/blog/2022 tháng 2/dia-diem-du-lich-viet-nam-1-819x1024.jpg?tr=q-70,c-at_max,w-500,h-300,dpr-2",
        favoritePlaces: ["place_001", "place_002"],
//        reviews: ["review_001", "review_002"],
        calendarPlaces: ["place_003"]
    ),
    UserModel(
        userId: "user_002",
        name: "Trần Thị B",
        email: "tranthib@example.com",
        phone: "0976543210",
        avatar: "https://ik.imagekit.io/tvlk/blog/2022 tháng 2/dia-diem-du-lich-viet-nam-9-820x1024.jpg?tr=q-70,c-at_max,w-500,h-300,dpr-2",
        favoritePlaces: ["place_002"],
//        reviews: ["review_003"],
        calendarPlaces: ["place_001", "place_004"]
    )
]
