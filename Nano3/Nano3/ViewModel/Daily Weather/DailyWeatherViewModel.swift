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
   
   @Published var dailyForecast : [DayWeather]?
   @Published var hourlyForecast: [HourWeather]?
   
   private var weatherServiceManager : DailyWeatherDelegate
   
   init(){
      weatherServiceManager = WeatherServiceManager()
   }
   
   func getDailyWeatherForecast(location : CLLocation) async {
      do{
         let fetchedForecast = try await weatherServiceManager.getSevenDayForecast(location: location)
         
         DispatchQueue.main.async{
            self.dailyForecast = fetchedForecast
         }
      }catch{
         print("Error fetching daily forecast")
      }
   }
   
   func areDatesSameDay(_ date1: Date, _ date2: Date) -> Bool {
      let calendar = Calendar.current
      
      let components1 = calendar.dateComponents([.year, .month, .day], from: date1)
      let components2 = calendar.dateComponents([.year, .month, .day], from: date2)
      
      return components1 == components2
   }
}
