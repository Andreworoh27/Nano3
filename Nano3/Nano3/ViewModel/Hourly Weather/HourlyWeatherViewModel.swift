//
//  HourlyWeatherViewModel.swift
//  Nano3
//
//  Created by Paulus Michael on 15/07/24.
//

import Foundation
import WeatherKit
import CoreLocation

class HourlyWeatherViewModel: ObservableObject {
   @Published var selectedDate: Date = Date.now
   @Published var hourlyForecast : [HourWeather]?
   static let shared = HourlyWeatherViewModel()
   
   private var weatherServiceManager : HourlyWeatherDelegate
   
   init(){
      weatherServiceManager = WeatherServiceManager()
   }
   
   func getHourlyForecast(location : CLLocation, date: Date) async {
      print("Fetch called")
      
      if (Date.isToday(inputDate: date)){
         Task{
            self.hourlyForecast = await weatherServiceManager.getHourlyWeather(location: location, date: date)
         }
      } else {
         var components = Calendar.current.dateComponents([.year, .month, .day,.hour], from: date)
         
         components.hour = 6
         
         let date = Calendar.current.date(from: components)
         
         Task{
            self.hourlyForecast = await weatherServiceManager.getHourlyWeather(location: location, date: date!)
         }
      }
   }
}
