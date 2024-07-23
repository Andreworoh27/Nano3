import SwiftUI
import Combine

class CurrentWeatherViewModel: ObservableObject {
   @Published var title: String
   @Published var timeRange: String
   @Published var description: String
   @Published var hourlyWeatherArray: [HourlyWeather]
   
   static let shared = CurrentWeatherViewModel()
   
   init(title: String = "", timeRange: String = "", description: String = "", hourlyWeatherArray: [HourlyWeather] = []) {
      self.title = title
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
         DispatchQueue.main.async{
            self.timeRange = "\(start.formattedHourMinute) - \(end.formattedHourMinute)"
            self.title = "Best times to play outdoors"
            self.description = "Enjoy outdoor playtime with your kids during  these safe UV hours, with gentler sun  and less risk of sunburn!"
         }
      } else {
         //         self.timeRange = "No suitable time frame found"
         DispatchQueue.main.async{
            self.title = "Indoor play day"
            self.description = "Rainy day? Make it special with  indoor games and activities with your kids!"
         }
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
