//
//  WeatherServiceManager.swift
//  Nano3
//
//  Created by Andrew Oroh on 13/07/24.
//

import Foundation
import CoreLocation
import WeatherKit

class WeatherServiceManager : CurrentWeatherDelegate, DailyWeatherDelegate, HourlyWeatherDelegate{
   
   private let weatherService : WeatherService
   
   //    @Published var weather : Weather?
   //    @Published var sevenDayForecast : [DayWeather]?
   
   
   init(){
      weatherService = WeatherService.shared
   }
   
   func getHourlyWeather(location: CLLocation, date: Date) async -> [HourlyWeather]? {
      var components = Calendar.current.dateComponents([.year, .month, .day, .hour], from: date)
      
      if components.hour! > 18 {
         return nil
      }
      do{
         components.hour = 19
         let endDate = Calendar.current.date(from: components)
         guard let validEndDate = endDate else {
            print("Error creating end date")
            return nil
         }
         
          let hourlyWeather = try await weatherService.weather(for: location, including: .hourly(startDate: date, endDate: validEndDate)).forecast
          var hourlyWeatherData : [HourlyWeather] = []
          hourlyWeather.forEach { hourWeather in
              
              let newHourWeather = HourlyWeather(hour: hourWeather.date, condition: hourWeather.condition, uvi: hourWeather.uvIndex.value, uviDesc: hourWeather.uvIndex.category.description, symbol: hourWeather.symbolName)
              hourlyWeatherData.append(newHourWeather)
          }
         return hourlyWeatherData
          
      }catch{
         print("Error")
      }
      
      return nil
   }
   
   func getCurrentWeather(location : CLLocation) async -> CurrentWeather?{
      do{
         //            weather = try await weatherService.weather(for: locationServiceManager.currentLocation ?? CLLocation(latitude: 6.1702, longitude: 106.6403))
         
         let currentweather = try await weatherService.weather(for: location).currentWeather
         
         return currentweather
         
         //            DispatchQueue.main.async{
         //                self.weather = currentweather
         //            }
      }catch{
         print("Error get current weather")
      }
      
      return nil
   }
   
   func getSevenDayForecast(location : CLLocation) async -> [DayWeather]?{
      do{
         let endDate = Calendar.current.date(byAdding: .day, value: 8, to: Date())
         
         return try await weatherService.weather(for: location, including: .daily(startDate: Date(), endDate: endDate!)).forecast
         
      }catch{
         print("Error get 7 day forecast")
      }
      return nil
   }
}
