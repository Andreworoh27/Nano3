//
//  HourlyWeatherModel.swift
//  Nano3
//
//  Created by Paulus Michael on 14/07/24.
//

import Foundation

struct HourlyWeatherModel: Identifiable {
    let id = UUID()
    let time: String
    let uvi: String
    let symbolName: String
    let activitySymbolName: String
}
