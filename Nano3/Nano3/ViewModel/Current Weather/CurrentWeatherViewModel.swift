import SwiftUI
import Combine

class CurrentWeatherViewModel: ObservableObject {
    @Published var title: String
    @Published var date: String
    @Published var timeRange: String
    @Published var description: String
    var hourlyWeatherArray: [HourlyWeather] = []

    init(title: String = "", date: String = "", timeRange: String = "", description: String = "", hourlyWeatherArray: [HourlyWeather]) {
        self.title = title
        self.date = date
        self.timeRange = ""
        self.description = description
        self.hourlyWeatherArray = hourlyWeatherArray
        findBestTimeFrame(for: hourlyWeatherArray)
    }
    
    func findBestTimeFrame(for hourlyWeathers: [HourlyWeather]) {
        var bestStart: Date?
        var bestEnd: Date?
        var bestLength = 0
        
        var currentStart: Date?
        var currentEnd: Date?
        var currentLength = 0
        
        for weather in hourlyWeathers {
            if weather.walkable {
                if currentStart == nil {
                    currentStart = weather.hour
                }
                currentEnd = weather.hour
                currentLength += 1
            } else {
                if currentLength > bestLength {
                    bestStart = currentStart
                    bestEnd = currentEnd
                    bestLength = currentLength
                }
                currentStart = nil
                currentEnd = nil
                currentLength = 0
            }
        }
        
        // Final check in case the longest walkable period is at the end of the array
        if currentLength > bestLength {
            bestStart = currentStart
            bestEnd = currentEnd
        }
        
        if let start = bestStart, let end = bestEnd {
            self.timeRange = "\(start.formattedHourMinute) - \(end.formattedHourMinute)"
        } else {
            self.timeRange = "No suitable time frame found"
        }
    }
}

extension Date {
    var formattedHourMinute: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }
}
