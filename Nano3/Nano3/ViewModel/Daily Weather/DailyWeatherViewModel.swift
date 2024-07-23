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
   
   @Published var isLoading = true
   
   private var weatherServiceManager : DailyWeatherDelegate
   
   init(){
      weatherServiceManager = WeatherServiceManager()
      isLoading = true
   }
   
   func getDailyWeatherForecast(location : CLLocation, date: Date) async {
      let fetched = await weatherServiceManager.getSevenDayForecast(location: location, date: date)
      
      DispatchQueue.main.async{
         self.dailyForecast = fetched
         self.isLoading = false
      }
   }
   
   func areDatesSameDay(_ date1: Date, _ date2: Date) -> Bool {
      let calendar = Calendar.current
      
      let components1 = calendar.dateComponents([.year, .month, .day], from: date1)
      let components2 = calendar.dateComponents([.year, .month, .day], from: date2)
      
      return components1 == components2
   }
    
}
