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
   @Published var hourlyForecast: [HourWeather]?
   
   private var weatherServiceManager : HourlyWeatherDelegate
   
   init(){
      weatherServiceManager = WeatherServiceManager()
   }
   
   func getHourlyForecast(location : CLLocation, date: Date) async {
      self.hourlyForecast = await weatherServiceManager.getHourlyWeather(location: location, date: date)
   }
}
