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
   
   private var weatherService : WeatherService
   
   //    @Published var weather : Weather?
   //    @Published var sevenDayForecast : [DayWeather]?
   
   
   init(){
      weatherService = WeatherService.shared
   }
   
   func getHourlyWeather(location: CLLocation, date: Date) async -> [HourWeather]? {
      do{
         let endDate = Calendar.current.date(byAdding: .hour, value: 13, to: date)!
         
         let hourlyWeather = try await weatherService.weather(for: location, including: .hourly(startDate: date, endDate: endDate)).forecast
         
         return hourlyWeather
      }catch{
         print("Error get hourly weather")
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
