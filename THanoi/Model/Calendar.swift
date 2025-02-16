//
//  Calendar.swift
//  THanoi
//
//  Created by Tuấn on 16/2/25.
//

import Foundation

struct Calendar {
    let id: String
    let placedId: String?
    var isVisited: Bool?
    let addedDate: String?
    let createdAt: String?
}


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
