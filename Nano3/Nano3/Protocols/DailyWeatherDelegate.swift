//
//  DailyWeatherDelegate.swift
//  Nano3
//
//  Created by Paulus Michael on 14/07/24.
//

import Foundation
import CoreLocation
import WeatherKit

protocol DailyWeatherDelegate {
   func getSevenDayForecast(location: CLLocation, date: Date) async -> [DayWeather]?
}
