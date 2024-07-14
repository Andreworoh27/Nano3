//
//  HourlyWeatherView.swift
//  Nano3
//
//  Created by Paulus Michael on 12/07/24.
//

import SwiftUI

struct HourlyWeatherView: View {
    let hourlyWeatherData: [HourlyWeather] = [
        HourlyWeather(parsedData: ParsedHourlyWeatherData(time: Calendar.current.date(bySettingHour: 6, minute: 0, second: 0, of: Date())!, precipitation: .none, uvi: 2)),
        HourlyWeather(parsedData: ParsedHourlyWeatherData(time: Calendar.current.date(bySettingHour: 7, minute: 0, second: 0, of: Date())!, precipitation: .partialCloud, uvi: 3)),
        HourlyWeather(parsedData: ParsedHourlyWeatherData(time: Calendar.current.date(bySettingHour: 8, minute: 0, second: 0, of: Date())!, precipitation: .cloudy, uvi: 5))
        // Add more data as needed
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "clock")
                Text("Available Playtime Hours: 6 AM - 6 PM")
                    .fontWeight(.bold)
            }
            
            Divider()
                .background(.white)
            
            ForEach(Array(hourlyWeatherData.enumerated()), id: \.element.id) { index, weather in
                HStack(alignment: .center) {
                    Text(weather.hour, style: .time)
                        .fontWeight(.semibold)
                        .font(Font.system(size: 22))
                    
                    Spacer()
                    
                    Image(systemName: weather.precipitation.symbolName)
                        .imageScale(.large)
                    
                    VStack(alignment: .leading) {
                        Text("UVI: \(weather.uvi)")
                            .font(.caption)
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 100, height: 5)
                    }
                    
                    Spacer()
                    
                    Image(systemName: weather.walkable ? "figure.walk" : "nosign")
                        .imageScale(.large)
                }
                
                if index < hourlyWeatherData.count - 1 {
                    Divider()
                        .background(.white)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .foregroundStyle(.white)
    }
}

extension Precipitation {
    var symbolName: String {
        switch self {
        case .none:
            return "sun.max.fill"
        case .rain:
            return "cloud.rain.fill"
        case .snow:
            return "snow"
        case .partialCloud:
            return "cloud.sun.fill"
        case .cloudy:
            return "cloud.fill"
        }
    }
}

#Preview {
    HourlyWeatherView()
        .background(.black)
}
