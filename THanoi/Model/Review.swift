//
//  Review.swift
//  THanoi
//
//  Created by Tuấn on 16/2/25.
//

import Foundation

struct Review {
    let id: String
    let placeId: String?
    let userId: String?
    let avatarUser: String?
    let rating: Int?
    let comment: String?
    let reported: Bool?
    let reportReason: String?
    let createdAt: Date
}

let reviews: [Review] = [
    Review(
        id: "review_001",
        placeId: "place_001",
        userId: "user_001",
        avatarUser: "https://file3.qdnd.vn/data/images/0/2023/05/03/vuhuyen/khanhphan.jpg",
        rating: 5,
        comment: "Nơi này rất đẹp và yên bình.",
        reported: false,
        reportReason: nil,
        createdAt: Date()
    ),
    Review(
        id: "review_002",
        placeId: "place_002",
        userId: "user_001",
        avatarUser: "https://file3.qdnd.vn/data/images/0/2023/05/03/vuhuyen/khanhphan.jpg",
        rating: 4,
        comment: "Bãi biển rất đẹp nhưng hơi đông người.",
        reported: false,
        reportReason: nil,
        createdAt: Date()
        
    ),
    Review(
        id: "review_003",
        placeId: "place_002",
        userId: "user_002",
        avatarUser: "https://file3.qdnd.vn/data/images/0/2023/05/03/vuhuyen/khanhphan.jpg",
        rating: 3,
        comment: "Nước biển hơi lạnh vào mùa đông.",
        reported: true,
        reportReason: "Thông tin không chính xác",
        createdAt: Date()

    )
]
