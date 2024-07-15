import SwiftUI
import Combine

class CurrentWeatherViewModel: ObservableObject {
    @Published var title: String
    @Published var date: String
    @Published var timeRange: String
    @Published var description: String
    
    let dummyData: [HourlyWeather] = [
        HourlyWeather(hour: Calendar.current.date(bySettingHour: 6, minute: 0, second: 0, of: Date())!, condition: .clear, uvi: 5, uviDesc: "Moderate", symbol: "sun.max"),
        HourlyWeather(hour: Calendar.current.date(bySettingHour: 7, minute: 0, second: 0, of: Date())!, condition: .mostlyClear, uvi: 3, uviDesc: "Low", symbol: "sun.max"),
        HourlyWeather(hour: Calendar.current.date(bySettingHour: 8, minute: 0, second: 0, of: Date())!, condition: .breezy, uvi: 6, uviDesc: "Moderate", symbol: "wind"),
        HourlyWeather(hour: Calendar.current.date(bySettingHour: 9, minute: 0, second: 0, of: Date())!, condition: .windy, uvi: 2, uviDesc: "Low", symbol: "wind"),
        HourlyWeather(hour: Calendar.current.date(bySettingHour: 10, minute: 0, second: 0, of: Date())!, condition: .partlyCloudy, uvi: 4, uviDesc: "Moderate", symbol: "cloud.sun"),
        HourlyWeather(hour: Calendar.current.date(bySettingHour: 11, minute: 0, second: 0, of: Date())!, condition: .cloudy, uvi: 8, uviDesc: "High", symbol: "cloud"),
        HourlyWeather(hour: Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: Date())!, condition: .blizzard, uvi: 0, uviDesc: "None", symbol: "cloud.rain"),
        HourlyWeather(hour: Calendar.current.date(bySettingHour: 13, minute: 0, second: 0, of: Date())!, condition: .blizzard, uvi: 0, uviDesc: "None", symbol: "snow")
    ]

    init(title: String = "", date: String = "", timeRange: String = "", description: String = "") {
        self.title = title
        self.date = date
        self.timeRange = ""
        self.description = description
        findBestTimeFrame(for: dummyData)
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
