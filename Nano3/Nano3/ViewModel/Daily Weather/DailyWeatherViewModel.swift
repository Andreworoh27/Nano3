//
//  DailyWeatherViewModel.swift
//  Nano3
//
//  Created by Andrew Oroh on 13/07/24.
//

import Foundation
import WeatherKit
import CoreLocation

class DailyWeatherViewModel: ObservableObject{
   static let shared = DailyWeatherViewModel()
   
   @Published var dailyForecast : [DayWeather]?
   @Published var hourlyForecast: [HourWeather]?
   
   private var weatherServiceManager : DailyWeatherDelegate
   
   init(){
      weatherServiceManager = WeatherServiceManager()
   }
   
   func getDailyWeatherForecast(location : CLLocation) async {
      let fetched = await weatherServiceManager.getSevenDayForecast(location: location)
      
      DispatchQueue.main.async{
         self.dailyForecast = fetched
      }
   }
   
   func areDatesSameDay(_ date1: Date, _ date2: Date) -> Bool {
      let calendar = Calendar.current
      
      let components1 = calendar.dateComponents([.year, .month, .day], from: date1)
      let components2 = calendar.dateComponents([.year, .month, .day], from: date2)
      
      return components1 == components2
   }
    
    func findBestTimeFrame(for hourlyWeathers: [HourlyWeather]) -> (start: Date, end: Date)? {
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
        
        if currentLength > bestLength {
            bestStart = currentStart
            bestEnd = currentEnd
        }
        
        if let start = bestStart, let end = bestEnd {
            return (start, end)
        }
        
        return nil
    }
    
}
