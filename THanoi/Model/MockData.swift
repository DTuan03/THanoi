//
//  MockData.swift
//  THanoi
//
//  Created by Tuấn on 11/2/25.
//


import Foundation

// Mock UserModel Data
let users: [UserModel] = [
    UserModel(
        userId: "user_001",
        name: "Nguyễn Văn A",
        email: "nguyenvana@example.com",
        phone: "0987654321",
        avatar: "https://ik.imagekit.io/tvlk/blog/2022 tháng 2/dia-diem-du-lich-viet-nam-1-819x1024.jpg?tr=q-70,c-at_max,w-500,h-300,dpr-2",
        favoritePlaces: ["place_001", "place_002"],
        reviews: ["review_001", "review_002"],
        calendarPlaces: ["place_003"],
        createdAt: Date()
    ),
    UserModel(
        userId: "user_002",
        name: "Trần Thị B",
        email: "tranthib@example.com",
        phone: "0976543210",
        avatar: "https://ik.imagekit.io/tvlk/blog/2022 tháng 2/dia-diem-du-lich-viet-nam-9-820x1024.jpg?tr=q-70,c-at_max,w-500,h-300,dpr-2",
        favoritePlaces: ["place_002"],
        reviews: ["review_003"],
        calendarPlaces: ["place_001", "place_004"],
        createdAt: Date()
    )
]

// Mock Place Data
let places: [Place] = [
    Place(
        id: "place_001",
        name: "Hồ Gươm",
        description: "Một địa điểm nổi tiếng ở Hà Nội.",
        districtId: "TH3",
        address: "Yên Phụ, Hoàn Kiếm",
        latitude: 21.0285,
        longitude: 105.8542,
        category: ["Danh lam thắng cảnh"],
        avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg",
        images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"],
        avgRating: 4.5,
        totalReviews: 120,
        ownerId: "user_001",
        ownerName: "Nhat Minh",
        createdAt: Date()
    ),
    Place(
        id: "place_002",
        name: "Bãi biển Mỹ Khê",
        description: "Bãi biển đẹp nhất Đà Nẵng.",
        districtId: "TH1",
        address: "Hồ Tây, Tây Hồ",
        latitude: 16.0678,
        longitude: 108.2436,
        category: ["Bãi biển"],
        avatar: "https://sakos.vn/wp-content/uploads/2022/12/Hinh-anh-Haven-Sapa-cafe-o-dau-ban-Cat-Cat-hoangnam.jpg",
        images: ["https://sakos.vn/wp-content/uploads/2022/12/119784405-771407717028608-745894521627772501-o-3589.jpg", "https://sakos.vn/wp-content/uploads/2022/12/dao-ngoc-phu-quoc-2.jpg"],
        avgRating: 4.7,
        totalReviews: 95,
        ownerId: "user_002",
        ownerName: "Nhat Minh",
        createdAt: Date()
    ),
    Place(
        id: "place_003",
        name: "Hồ Gươm",
        description: "Một địa điểm nổi tiếng ở Hà Nội.",
        districtId: "TH8",
        address: "Yên Phụ, Hoàn Kiếm",
        latitude: 21.0285,
        longitude: 105.8542,
        category: ["Danh lam thắng cảnh"],
        avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg",
        images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg"],
        avgRating: 4.5,
        totalReviews: 120,
        ownerId: "user_001",
        ownerName: "Nhat Minh",
        createdAt: Date()
    ),
    Place(
        id: "place_004",
        name: "Bãi biển Mỹ Khê jjrugjuirj jg ",
        description: "Bãi biển đẹp nhất Đà Nẵng.",
        districtId: "TH2",
        address: "Hồ Tây, Tây Hồ",
        latitude: 16.0678,
        longitude: 108.2436,
        category: ["Bãi biển"],
        avatar: "https://sakos.vn/wp-content/uploads/2022/12/Hinh-anh-Haven-Sapa-cafe-o-dau-ban-Cat-Cat-hoangnam.jpg",
        images: ["https://sakos.vn/wp-content/uploads/2022/12/119784405-771407717028608-745894521627772501-o-3589.jpg", "https://sakos.vn/wp-content/uploads/2022/12/dao-ngoc-phu-quoc-2.jpg"],
        avgRating: 4.7,
        totalReviews: 95,
        ownerId: "user_002",
        ownerName: "Nhat Minh",
        createdAt: Date()
    ),
    Place(
        id: "P001", name: "Nhà hàng Hoàng Gia", description: "Ẩm thực sang trọng", districtId: "TH1", address: "12 Đường Kim Mã", latitude: 21.0333, longitude: 105.8142, category: ["Ẩm thực"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 120, ownerId: "O001", ownerName: "Nhat Minh",
        createdAt: Date()
    ),
    Place(
        id: "P002", name: "Leo núi Ba Vì", description: "Trải nghiệm leo núi tuyệt vời", districtId: "TH2", address: "Vườn Quốc Gia Ba Vì", latitude: 21.0983, longitude: 105.3846, category: ["Mạo hiểm"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.6, totalReviews: 85, ownerId: "O002", ownerName: "Nhat Minh",
        createdAt: Date()
    ),
    Place(
        id: "P003", name: "Chợ Đêm Bắc Từ Liêm", description: "Mua sắm giá rẻ", districtId: "TH3", address: "Khu đô thị Ciputra", latitude: 21.0721, longitude: 105.7689, category: ["Mua sắm"], avatar: "https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.2, totalReviews: 200, ownerId: "O003", ownerName: "Nhat Minh",
        createdAt: Date()
    ),
    Place(
        id: "P004", name: "Chùa Trấn Quốc", description: "Ngôi chùa cổ linh thiêng", districtId: "TH24", address: "Đường Thanh Niên, Tây Hồ", latitude: 21.0486, longitude: 105.8281, category: ["Tâm linh"], avatar: "https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.9, totalReviews: 500, ownerId: "O004", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(
        id: "P005", name: "Bảo tàng Dân Tộc Học", description: "Khám phá văn hóa Việt Nam", districtId: "TH4", address: "Nguyễn Văn Huyên, Cầu Giấy", latitude: 21.0419, longitude: 105.7825, category: ["Trải nghiệm"], avatar: "https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.7, totalReviews: 300, ownerId: "O005", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(
        id: "P006", name: "Phố cổ Hà Nội", description: "Khám phá nét cổ kính của thủ đô", districtId: "TH13", address: "Quận Hoàn Kiếm", latitude: 21.0285, longitude: 105.8542, category: ["Trải nghiệm"], avatar: "https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 1500, ownerId: "O006", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(
        id: "P007", name: "Hồ Tây", description: "Điểm ngắm hoàng hôn tuyệt đẹp", districtId: "TH24", address: "Quận Tây Hồ", latitude: 21.0552, longitude: 105.8262, category: ["Cảnh quan"], avatar: "https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.7, totalReviews: 800, ownerId: "O007", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(
        id: "P008", name: "Aeon Mall Long Biên", description: "Trung tâm thương mại hiện đại", districtId: "TH15", address: "Sài Đồng, Long Biên", latitude: 21.0375, longitude: 105.9314, category: ["Mua sắm"], avatar: "https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.6, totalReviews: 900, ownerId: "O008", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(
        id: "P009", name: "Khu du lịch Tam Đảo", description: "Nơi nghỉ dưỡng lý tưởng", districtId: "TH23", address: "Huyện Sóc Sơn", latitude: 21.4565, longitude: 105.6138, category: ["Cảnh quan"], avatar: "https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.9, totalReviews: 700, ownerId: "O009", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(
        id: "P010", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(
        id: "P011", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH14", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date() ),
    Place(
        id: "P012", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH15", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(
        id: "P013", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH16", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(
        id: "P0134", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH17", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(
        id: "P01345", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH18", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(
        id: "P013456", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH19", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(
        id: "P0134567", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH20", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(
        id: "P01345678", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH21", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(
        id: "P013456789", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(
        id: "P0134567899", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(
        id: "P01345678990", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(
        id: "P013456789904", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(
        id: "P0134567899042", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(
        id: "P01345678990422", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(
        id: "P013456789904225", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(
        id: "P0155", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(
        id: "P015", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(
        id: "P01552", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(
        id: "P015523", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(
        id: "P0155231", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P01552314", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P0155231465", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P01552314654", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P015523146543", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P016", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P01645", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P0164", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P016452", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P01645212", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P016452121", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P01645121", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P0164521", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P016452125", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P017", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P0171", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P01712", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P017123", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P0171234", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P01712345", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P017123456", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P0171234567", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P01712345678", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P017123456788", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P0171234567889", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P018", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P0181", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P01812", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P01814", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P018125", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P0181256", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P01812567", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P018125678", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P0181256783", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P018125678345", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P010", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P019", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P0191", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P01912", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P019123", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    Place(id: "P0191234", name: "Nhà thờ lớn Hà Nội", description: "Công trình kiến trúc Pháp cổ", districtId: "TH13", address: "Nhà Chung, Hoàn Kiếm", latitude: 21.0288, longitude: 105.8502, category: ["Tâm linh"], avatar: "https://dulichsaigon.edu.vn/wp-content/uploads/2024/02/top-cac-loai-hinh-du-lich-pho-bien-tai-viet-nam-nhieu-ban-tre-yeu-thich.jpg", images: ["https://bactuliem.hanoi.gov.vn/image/journal/article?img_id=957765&t=1739387648844", "https://sakos.vn/wp-content/uploads/2022/12/WTTC-Gives-Seven-More-Countries-Safe-Travel-Stamp-2-2.jpg", "https://dulichsaigon.edu.vn/wp-content/uploads/2024/01/du-lich-van-hoa.jpg"], avgRating: 4.8, totalReviews: 650, ownerId: "O010", ownerName: "Nhat Minh",
        createdAt: Date()),
    
]

let reviews: [Review] = [
    Review(
        id: "review_001",
        placeId: "place_001",
        userId: "user_001",
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
        rating: 3,
        comment: "Nước biển hơi lạnh vào mùa đông.",
        reported: true,
        reportReason: "Thông tin không chính xác",
        createdAt: Date()
    )
]

let districts: [District] = [
    District(id: "TH1", name: "Ba Đình"),
    District(id: "TH2", name: "Ba Vì"),
    District(id: "TH3", name: "Bắc Từ Liêm"),
    District(id: "TH4", name: "Cầu Giấy"),
    District(id: "TH5", name: "Chương Mỹ"),
    District(id: "TH6", name: "Đan Phượng"),
    District(id: "TH7", name: "Đống Đa"),
    District(id: "TH8", name: "Đông Anh"),
    District(id: "TH9", name: "Gia Lâm"),
    District(id: "TH10", name: "Hà Đông"),
    District(id: "TH11", name: "Hai Bà Trưng"),
    District(id: "TH12", name: "Hoài Đức"),
    District(id: "TH13", name: "Hoàn Kiếm"),
    District(id: "TH14", name: "Hoàng Mai"),
    District(id: "TH15", name: "Long Biên"),
    District(id: "TH16", name: "Mê Linh"),
    District(id: "TH17", name: "Mỹ Đức"),
    District(id: "TH18", name: "Nam Từ Liêm"),
    District(id: "TH19", name: "Phú Xuyên"),
    District(id: "TH20", name: "Phúc Thọ"),
    District(id: "TH21", name: "Quốc Oai"),
    District(id: "TH22", name: "Sơn Tây"),
    District(id: "TH23", name: "Sóc Sơn"),
    District(id: "TH24", name: "Tây Hồ"),
    District(id: "TH25", name: "Thạch Thất"),
    District(id: "TH26", name: "Thanh Oai"),
    District(id: "TH27", name: "Thanh Trì"),
    District(id: "TH28", name: "Thanh Xuân"),
    District(id: "TH29", name: "Thường Tín"),
    District(id: "TH30", name: "Ứng Hòa")
]

struct Category {
    let name: String
    let image: String
}

let category = [
    Category(name: "Ẩm thực", image: "amThuc"),
    Category(name: "Mạo hiểm", image: "maoHiem"),
    Category(name: "Tâm linh", image: "tamLinh"),
    Category(name: "Cảnh quan", image: "canhQuan"),
    Category(name: "Mua sắm", image: "muaSam")
]

var calendars = [
    Calendar(id: "c1", placedId: "P001", isVisited: true, addedDate: "13 tháng 2 2025", createdAt: "10/02/2025"),
    Calendar(id: "c2", placedId: "P002", isVisited: false, addedDate: "12 tháng 2 2025", createdAt: "11/02/2025"),
    Calendar(id: "c3", placedId: "P003", isVisited: true, addedDate: "13 tháng 2 2025", createdAt: "10/02/2025"),
    Calendar(id: "c4", placedId: "P004", isVisited: false, addedDate: "12 tháng 2 2025", createdAt: "11/02/2025"),
    Calendar(id: "c5", placedId: "P005", isVisited: true, addedDate: "13 tháng 2 2025", createdAt: "12/02/2025"),
    Calendar(id: "c6", placedId: "P006", isVisited: false, addedDate: "12 tháng 2 2025", createdAt: "11/02/2025"),
    Calendar(id: "c7", placedId: "P007", isVisited: true, addedDate: "11 tháng 2 2025", createdAt: "08/02/2025"),
    Calendar(id: "c8", placedId: "P008", isVisited: false, addedDate: "12 tháng 2 2025", createdAt: "04/02/2025"),
    Calendar(id: "c9", placedId: "P009", isVisited: false, addedDate: "13 tháng 2 2025", createdAt: "09/02/2025"),
    Calendar(id: "c10", placedId: "P010", isVisited: false, addedDate: "11 tháng 2 2025", createdAt: "10/02/2025"),
]

let favorites = [
    Favorite(id: "f1", placedId: "P001", createdAt: "10/02/2025"),
    Favorite(id: "f2", placedId: "P002", createdAt: "11/02/2025"),
    Favorite(id: "f3", placedId: "P004", createdAt: "09/02/2025"),
    Favorite(id: "f4", placedId: "P005", createdAt: "08/03/2025"),
    Favorite(id: "f5", placedId: "P006", createdAt: "07/02/2024")
]
