//
//  PlaceModel.swift
//  THanoi
//
//  Created by Tuấn on 22/1/25.
//

import Foundation


struct PlaceModel {
    let id: UUID
    let name: String
    let address: String
    let district: String
    let description: String
    let avatar: String
    let imageUrl: [String]
    let averageRating: Double // Điểm đánh giá trung bình
    let totalReviews: Int     // Số lượng đánh giá
    let latitude: Double
    let longitude: Double
    let createdAt: Date // dung de sap xep hien thi theo thoi gian duoc them vao
    let tags: [String] //danh sach cac the lien quan (du lich, am thuc, mao hiem,...)
}

let places: [PlaceModel] = [
    PlaceModel(id: UUID(), name: "Địa điểm 98", address: "Số 88 đường ABC, Ứng Hoà", district: "Ứng Hòa", description: "Mô tả địa điểm, một địa điểm du lịch hấp dẫn và nổi tiếng.", avatar: "https://placeimg.com/640/480/any?random=14", imageUrl: ["https://placeimg.com/640/480/any?random=1", "https://placeimg.com/640/480/any?random=2", "https://placeimg.com/640/480/any?random=3"], averageRating: 3.7, totalReviews: 124, latitude: 21.383982, longitude: 105.473021, createdAt: Date(), tags: ["thư giãn", "thể thao", "phong cảnh"]),
    
    PlaceModel(id: UUID(), name: "Địa điểm 39", address: "Số 90 đường ABC, Ba Đình", district: "Hai Bà Trưng", description: "Mô tả địa điểm, một địa điểm du lịch hấp dẫn và nổi tiếng.", avatar: "https://placeimg.com/640/480/any?random=89", imageUrl: ["https://placeimg.com/640/480/any?random=1", "https://placeimg.com/640/480/any?random=2", "https://placeimg.com/640/480/any?random=3"], averageRating: 3.9, totalReviews: 67, latitude: 21.237551, longitude: 105.371847, createdAt: Date(), tags: ["thư giãn", "phong cảnh"]),
    
    PlaceModel(id: UUID(), name: "Địa điểm 79", address: "Số 90 đường ABC, Thường Tín", district: "Ba Vì", description: "Mô tả địa điểm, một địa điểm du lịch hấp dẫn và nổi tiếng.", avatar: "https://placeimg.com/640/480/any?random=4", imageUrl: ["https://placeimg.com/640/480/any?random=1", "https://placeimg.com/640/480/any?random=2", "https://placeimg.com/640/480/any?random=3"], averageRating: 3.5, totalReviews: 166, latitude: 21.179553, longitude: 105.696312, createdAt: Date(), tags: ["văn hóa", "ẩm thực", "mạo hiểm"]),
    
    PlaceModel(id: UUID(), name: "Địa điểm 48", address: "Số 90 đường ABC, Đông Anh", district: "Gia Lâm", description: "Mô tả địa điểm, một địa điểm du lịch hấp dẫn và nổi tiếng.", avatar: "https://placeimg.com/640/480/any?random=10", imageUrl: ["https://placeimg.com/640/480/any?random=1", "https://placeimg.com/640/480/any?random=2", "https://placeimg.com/640/480/any?random=3"], averageRating: 4.2, totalReviews: 245, latitude: 21.078423, longitude: 105.846394, createdAt: Date(), tags: ["du lịch", "thể thao", "phong cảnh"]),
    
    PlaceModel(id: UUID(), name: "Địa điểm 93", address: "Số 120 đường ABC, Sơn Tây", district: "Sóc Sơn", description: "Mô tả địa điểm, một địa điểm du lịch hấp dẫn và nổi tiếng.", avatar: "https://placeimg.com/640/480/any?random=21", imageUrl: ["https://placeimg.com/640/480/any?random=1", "https://placeimg.com/640/480/any?random=2", "https://placeimg.com/640/480/any?random=3"], averageRating: 4.0, totalReviews: 298, latitude: 21.061212, longitude: 105.301452, createdAt: Date(), tags: ["di tích lịch sử", "mạo hiểm"]),
    
    PlaceModel(id: UUID(), name: "Địa điểm 83", address: "Số 21 đường ABC, Hoàng Mai", district: "Phúc Thọ", description: "Mô tả địa điểm, một địa điểm du lịch hấp dẫn và nổi tiếng.", avatar: "https://placeimg.com/640/480/any?random=61", imageUrl: ["https://placeimg.com/640/480/any?random=1", "https://placeimg.com/640/480/any?random=2", "https://placeimg.com/640/480/any?random=3"], averageRating: 4.1, totalReviews: 391, latitude: 21.236641, longitude: 105.087737, createdAt: Date(), tags: ["thể thao", "văn hóa"]),
    
    PlaceModel(id: UUID(), name: "Địa điểm 10", address: "Số 60 đường ABC, Phúc Thọ", district: "Quốc Oai", description: "Mô tả địa điểm, một địa điểm du lịch hấp dẫn và nổi tiếng.", avatar: "https://placeimg.com/640/480/any?random=6", imageUrl: ["https://placeimg.com/640/480/any?random=1", "https://placeimg.com/640/480/any?random=2", "https://placeimg.com/640/480/any?random=3"], averageRating: 3.3, totalReviews: 331, latitude: 21.462371, longitude: 105.598179, createdAt: Date(), tags: ["mạo hiểm", "ẩm thực", "di tích lịch sử"]),
    
    PlaceModel(id: UUID(), name: "Địa điểm 87", address: "Số 50 đường ABC, Hoàn Kiếm", district: "Chương Mỹ", description: "Mô tả địa điểm, một địa điểm du lịch hấp dẫn và nổi tiếng.", avatar: "https://placeimg.com/640/480/any?random=37", imageUrl: ["https://placeimg.com/640/480/any?random=1", "https://placeimg.com/640/480/any?random=2", "https://placeimg.com/640/480/any?random=3"], averageRating: 4.9, totalReviews: 449, latitude: 21.134281, longitude: 105.487302, createdAt: Date(), tags: ["du lịch", "ẩm thực", "mạo hiểm"]),
    
    PlaceModel(id: UUID(), name: "Địa điểm 55", address: "Số 110 đường ABC, Hà Đông", district: "Mê Linh", description: "Mô tả địa điểm, một địa điểm du lịch hấp dẫn và nổi tiếng.", avatar: "https://placeimg.com/640/480/any?random=2", imageUrl: ["https://placeimg.com/640/480/any?random=1", "https://placeimg.com/640/480/any?random=2", "https://placeimg.com/640/480/any?random=3"], averageRating: 4.0, totalReviews: 150, latitude: 21.085742, longitude: 105.444388, createdAt: Date(), tags: ["thể thao", "di tích lịch sử"]),
    
    PlaceModel(id: UUID(), name: "Địa điểm 55", address: "Số 110 đường ABC, Hà Đông", district: "Ba Đình", description: "Mô tả địa điểm, một địa điểm du lịch hấp dẫn và nổi tiếng.", avatar: "https://placeimg.com/640/480/any?random=2", imageUrl: ["https://placeimg.com/640/480/any?random=1", "https://placeimg.com/640/480/any?random=2", "https://placeimg.com/640/480/any?random=3"], averageRating: 4.0, totalReviews: 150, latitude: 21.085742, longitude: 105.444388, createdAt: Date(), tags: ["thể thao", "di tích lịch sử"]),
    
    PlaceModel(id: UUID(), name: "Địa điểm 55", address: "Số 110 đường ABC, Hà Đông", district: "Bắc Từ Liêm", description: "Mô tả địa điểm, một địa điểm du lịch hấp dẫn và nổi tiếng.", avatar: "https://placeimg.com/640/480/any?random=2", imageUrl: ["https://placeimg.com/640/480/any?random=1", "https://placeimg.com/640/480/any?random=2", "https://placeimg.com/640/480/any?random=3"], averageRating: 4.0, totalReviews: 150, latitude: 21.085742, longitude: 105.444388, createdAt: Date(), tags: ["thể thao", "di tích lịch sử"]),
    
    PlaceModel(id: UUID(), name: "Địa điểm 87", address: "Số 50 đường ABC, Hoàn Kiếm", district: "Ba Đình", description: "Mô tả địa điểm, một địa điểm du lịch hấp dẫn và nổi tiếng.", avatar: "https://placeimg.com/640/480/any?random=37", imageUrl: ["https://placeimg.com/640/480/any?random=1", "https://placeimg.com/640/480/any?random=2", "https://placeimg.com/640/480/any?random=3"], averageRating: 4.9, totalReviews: 449, latitude: 21.134281, longitude: 105.487302, createdAt: Date(), tags: ["du lịch", "ẩm thực", "mạo hiểm"])
]


let districtsInHanoi = [
    "Ba Đình",
    "Ba Vì",
    "Bắc Từ Liêm",
    "Cầu Giấy",
    "Chương Mỹ",
    "Đan Phượng",
    "Đống Đa",
    "Đông Anh",
    "Gia Lâm",
    "Hà Đông",
    "Hai Bà Trưng",
    "Hoài Đức",
    "Hoàn Kiếm",
    "Hoàng Mai",
    "Long Biên",
    "Mê Linh",
    "Mỹ Đức",
    "Nam Từ Liêm",
    "Phú Xuyên",
    "Phúc Thọ",
    "Quốc Oai",
    "Sơn Tây",
    "Sóc Sơn",
    "Tây Hồ",
    "Thạch Thất",
    "Thanh Oai",
    "Thanh Trì",
    "Thanh Xuân",
    "Thường Tín",
    "Ứng Hòa"
]

let nameTags = [
    "Ẩm thực",
    "Tâm linh",
    "Trải nghiệm",
    "Mua sắm",
    "Mạo hiểm",
    "Cảnh quan"
]

