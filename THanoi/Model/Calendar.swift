//
//  Calendar.swift
//  THanoi
//
//  Created by Tuấn on 16/2/25.
//

import Foundation

struct Calendar {
    let placedId: String?
    var isVisited: Bool?
    let addedDate: String?
}


var calendars = [
    Calendar(placedId: "P001", isVisited: true, addedDate: "13 tháng 2 2025"),
    Calendar(placedId: "P002", isVisited: false, addedDate: "12 tháng 2 2025"),
    Calendar(placedId: "P003", isVisited: true, addedDate: "13 tháng 2 2025"),
    Calendar(placedId: "P004", isVisited: false, addedDate: "12 tháng 2 2025"),
    Calendar(placedId: "P005", isVisited: true, addedDate: "13 tháng 2 2025"),
    Calendar(placedId: "P006", isVisited: false, addedDate: "12 tháng 2 2025"),
    Calendar( placedId: "P007", isVisited: true, addedDate: "11 tháng 2 2025"),
    Calendar(placedId: "P008", isVisited: false, addedDate: "12 tháng 2 2025"),
    Calendar(placedId: "P009", isVisited: false, addedDate: "13 tháng 2 2025"),
    Calendar(placedId: "P010", isVisited: false, addedDate: "11 tháng 2 2025"),
]
