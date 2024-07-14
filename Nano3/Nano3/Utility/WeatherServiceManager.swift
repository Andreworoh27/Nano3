//
//  WeatherServiceManager.swift
//  Nano3
//
//  Created by Andrew Oroh on 13/07/24.
//

import Foundation
import CoreLocation
import WeatherKit

class WeatherServiceManager : CurrentWeatherDelegate, DailyWeatherDelegate{
   
   private var weatherService : WeatherService
   
   //    @Published var weather : Weather?
   //    @Published var sevenDayForecast : [DayWeather]?
   
   
   init(){
      weatherService = WeatherService.shared
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
         let endDate = Calendar.current.date(byAdding: .day, value: 6, to: Date())
         
         return try await weatherService.weather(for: location, including: .daily(startDate: Date(), endDate: endDate!)).forecast
         
      }catch{
         print("Error get 7 day forecast")
      }
      return nil
   }
}
