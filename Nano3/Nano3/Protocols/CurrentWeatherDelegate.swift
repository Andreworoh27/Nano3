//
//  CurrentWeatherDelegate.swift
//  Nano3
//
//  Created by Paulus Michael on 14/07/24.
//

import Foundation
import CoreLocation
import WeatherKit

protocol CurrentWeatherDelegate {
   func getCurrentWeather(location: CLLocation) async -> CurrentWeather?
}
