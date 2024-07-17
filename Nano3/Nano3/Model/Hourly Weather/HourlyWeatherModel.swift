//
//  HourlyWeather.swift
//  Nano3
//
//  Created by Ryan Kusnadi on 14/07/24.
//

import Foundation
import SwiftUI
import WeatherKit

class HourlyWeather: Identifiable {
   let hour: Date
   let condition: WeatherCondition
   let uvi: Int
   let uviDesc: String
   let symbol: String
   var walkable: Bool
   
   init(hour: Date, condition: WeatherCondition, uvi: Int, uviDesc: String, symbol: String) {
      self.hour = hour
      self.condition = condition
      self.uvi = uvi
      self.symbol = symbol
      self.uviDesc = uviDesc
      self.walkable = HourlyWeather.isWalkable(condition: condition, uvi: uvi)
   }
   
   private static func isWalkable(condition: WeatherCondition, uvi: Int) -> Bool {
      switch condition {
      case .clear, .mostlyClear, .breezy, .windy, .partlyCloudy:
         return uvi <= 7
      default:
         return false
      }
   }
}

extension HourlyWeather {
   var uviColor: Color {
      switch uviDesc {
      case "Low":
         return Color.green
      case "Moderate":
         return Color.yellow
      case "High":
         return Color.orange
      case "Very High":
         return Color.red
      case "Extreme":
         return Color.purple
      default:
         return Color.gray
      }
   }
}
