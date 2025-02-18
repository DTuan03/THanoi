//
//  CalendarDataManager.swift
//  THanoi
//
//  Created by Tuấn on 18/2/25.
//

import Foundation
import FirebaseFirestore

class CalendarDataManager {
    static let shared = CalendarDataManager()
    private init() {}
    
    var calendars: [Calendar] = []
    
    func loadCalendar(userId: String, completion: @escaping ([Calendar]) -> Void) {
        FirebaseService.shared.fetchUsers(userId: userId, completion: { user in
            let user = user
            self.calendars = user["calendars"] as? [Calendar] ?? []
        })
    }
    
    func addCalendar(userId: String, placeId: String, scheduledDate: String, completion: @escaping (Bool) -> Void) {
        let calendar: [String: Any]
        calendar = [
            "placeId" : placeId,
            "scheduledDate": scheduledDate,
            "isVisitted": false
        ]
        
        FirebaseService.shared.addCalendar(userId: userId, calendar: calendar, completion: { succes in
            if succes {
                completion(true)
            } else {
                completion(false)
            }
        })
    }
}
