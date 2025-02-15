//
//  WeatherService.swift
//  THanoi
//
//  Created by Tuấn on 16/2/25.
//

import Foundation
import UIKit

struct WeatherResponse: Codable {
    let list: [WeatherInfo]
}

struct WeatherInfo: Codable {
    let dt: TimeInterval
    let main: MainInfo
    let weather: [WeatherDetail]
}

struct MainInfo: Codable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}

struct WeatherDetail: Codable {
    let description: String
    let icon: String
}


class WeatherService {
    let apiKey = "63e219a3e543c0d7c9de62039d328dd0"
    let baseURL = "https://api.openweathermap.org/data/2.5/forecast"
    
    func fetchWeather(lat: Double, lon: Double, completion: @escaping ([WeatherInfo]?) -> Void) {
        let urlString = "\(baseURL)?lat=\(lat)&lon=\(lon)&units=metric&appid=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("API request failed: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            do {
                let weatherData = try JSONDecoder().decode(WeatherResponse.self, from: data)
                let filteredData = self.filterDailyWeather(weatherData.list) // Lọc dữ liệu
                
                DispatchQueue.main.async {
                    completion(filteredData)
                }
            } catch {
                print("JSON parsing error: \(error.localizedDescription)")
                completion(nil)
            }
        }
        task.resume()
    }
    
    
    
    private func filterDailyWeather(_ list: [WeatherInfo]) -> [WeatherInfo] {
        var dailyWeather: [WeatherInfo] = []
        var addedDates: Set<String> = []
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone.current
        
        let calendar = NSCalendar.current
        
        for item in list {
            let date = Date(timeIntervalSince1970: item.dt)
            let dateString = dateFormatter.string(from: date)
            
            let hour = calendar.component(.hour, from: date)
            
            if !addedDates.contains(dateString) && (hour >= 11 && hour <= 14) {
                dailyWeather.append(item)
                addedDates.insert(dateString)
            }
            
            if dailyWeather.count == 3 {
                break
            }
        }
        return dailyWeather
    }
}
