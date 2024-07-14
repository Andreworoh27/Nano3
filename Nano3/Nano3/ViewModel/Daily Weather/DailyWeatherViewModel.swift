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
   
   private var weatherServiceManager : DailyWeatherDelegate
   
   init(){
      weatherServiceManager = WeatherServiceManager()
   }
   
   @MainActor
   func getDailyWeatherForecast(location : CLLocation) async {
      self.dailyForecast = await weatherServiceManager.getSevenDayForecast(location: location)
   }
}
