//
//  HourlyWeatherDelegate.swift
//  Nano3
//
//  Created by Paulus Michael on 14/07/24.
//

import Foundation
import WeatherKit
import CoreLocation

protocol HourlyWeatherDelegate {
   func getHourlyWeather(location: CLLocation, date: Date) async -> [HourWeather]?
}
