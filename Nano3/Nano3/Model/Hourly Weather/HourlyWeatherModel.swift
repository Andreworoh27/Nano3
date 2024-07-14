//
//  HourlyWeather.swift
//  Nano3
//
//  Created by Ryan Kusnadi on 14/07/24.
//

import Foundation

enum Precipitation: String {
    case none = "None"
    case rain = "Rain"
    case snow = "Snow"
    case partialCloud = "Partial Cloud"
    case cloudy = "Cloudy"
}

struct ParsedHourlyWeatherData {
    let time: Date
    let precipitation: Precipitation
    let uvi: Int
}

class HourlyWeather: Identifiable {
    let hour: Date
    let precipitation: Precipitation
    let uvi: Int
    var walkable: Bool {
        return isWalkable()
    }
    
    init(parsedData: ParsedHourlyWeatherData) {
        self.hour = parsedData.time
        self.precipitation = parsedData.precipitation
        self.uvi = parsedData.uvi
    }
    
    private func isWalkable() -> Bool {
        switch precipitation {
        case .none, .partialCloud:
            return uvi <= 7
        case .rain, .snow, .cloudy:
            return false
        }
    }
}
