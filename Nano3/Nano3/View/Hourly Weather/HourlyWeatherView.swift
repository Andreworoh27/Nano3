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
         
         //         ForEach(Array(hourlyWeatherData.enumerated()), id: \.element.id) { index, weather in
         //            HStack(alignment: .center) {
         //               Text(weather.hour, style: .time)
         //                  .fontWeight(.semibold)
         //                  .font(Font.system(size: 22))
         //
         //               Spacer()
         //
         //               Image(systemName: weather.precipitation.symbolName)
         //                  .renderingMode(.original)
         //                  .imageScale(.large)
         //
         //               VStack(alignment: .leading) {
         //                  Text("UVI: \(weather.uvi)")
         //                     .font(.caption)
         //                  RoundedRectangle(cornerRadius: 25)
         //                     .frame(width: 100, height: 5)
         //               }
         //
         //               Spacer()
         //
         //               Image(systemName: weather.walkable ? "figure.walk" : "nosign")
         //                  .imageScale(.large)
         //            }
         //
         //            if index < hourlyWeatherData.count - 1 {
         //               Divider()
         //                  .background(.white)
         //            }
         //         }
         
         if let hourlyForecast = hourlyWeatherViewModel.hourlyForecast {
            ForEach(hourlyForecast, id: \.date){ hour in
               Divider()
                  .background(.white)
               
               HStack(alignment: .center) {
                  Text("\(hour.date.formatted(date: .omitted, time: .shortened))")
                     .fontWeight(.semibold)
                     .font(Font.system(size: 22))
                  
                  Spacer()
                  
                  Image(systemName: "\(hour.symbolName).fill")
                     .renderingMode(.original)
                     .imageScale(.large)
                  
                  VStack(alignment: .leading) {
                     Text("UVI: \(hour.uvIndex.value)")
                        .font(.caption)
                     RoundedRectangle(cornerRadius: 25)
                        .frame(width: 100, height: 5)
                  }
                  
                  Spacer()
                  
//                  Image(systemName: weather.walkable ? "figure.walk" : "nosign")
//                     .imageScale(.large)
               }
               
//               if index < hourlyWeatherData.count - 1 {
//                  Divider()
//                     .background(.white)
//               }
            }
         }
      }
      .padding()
      .frame(maxWidth: .infinity, alignment: .leading)
      .background(.ultraThinMaterial)
      .clipShape(RoundedRectangle(cornerRadius: 15))
      .foregroundStyle(.white)
      .task {
         //         Task{
         await hourlyWeatherViewModel.getHourlyForecast(location:locationViewModel.currentUserLocation!, date: Date.getSpecificDate(hour: 6, date: selectedDate)!)
         //         }
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
