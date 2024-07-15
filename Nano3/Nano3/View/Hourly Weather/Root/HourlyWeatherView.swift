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
   
   @StateObject var hourlyWeatherViewModel = HourlyWeatherViewModel()
   var locationViewModel = LocationViewModel.shared
   @Binding var selectedDate: Date
   
   var body: some View {
      VStack(alignment: .leading) {
         HStack {
            Image(systemName: "clock")
            Text("Available Playtime Hours: 6 AM - 6 PM")
               .fontWeight(.bold)
         }
         
         if let hourlyForecast = hourlyWeatherViewModel.hourlyForecast {
            ForEach(hourlyForecast, id: \.date){ hour in
            
               //yang mau diambil dari hour
//               hour.date
//               hour.condition
//               hour.symbolName
//               hour.uvIndex.value
               Text("\(hour.condition)")
               
            
//               HourlyWeatherRowView(date: hour.date, symbol: hour.symbolName, uvi: hour.uvIndex.value)
//               HourlyWeatherRowView(hourlyWeather: HourlyWeather( parsedData: ParsedHourlyWeatherData(time: hour.date, precipitation: hour.symbolName, uvi: hour.uvIndex.value)))
            }
         }
      }
      .padding()
      .frame(maxWidth: .infinity, alignment: .leading)
      .background(.ultraThinMaterial)
      .clipShape(RoundedRectangle(cornerRadius: 15))
      .foregroundStyle(.white)
      .task {
         await hourlyWeatherViewModel.getHourlyForecast(location:locationViewModel.currentUserLocation!, date: Date.getSpecificDate(hour: 6, date: selectedDate)!)
      }
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
   HourlyWeatherView(selectedDate: .constant(Date()))
      .background(.black)
}
