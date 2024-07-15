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
   
   @StateObject var hourlyWeatherViewModel = HourlyWeatherViewModel.shared
   var locationViewModel = LocationViewModel.shared
//   @Binding var selectedDate: Date
   
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
//               Text("\(hour.condition)")
               
               Text("\(hour.date.formatted(date: .omitted, time: .shortened))")
//               HourlyWeatherRowView(hourlyWeather: HourlyWeather( parsedData: ParsedHourlyWeatherData(time: hour.date, precipitation: hour.symbolName, uvi: hour.uvIndex.value)))
            }
         }
      }
      .padding()
      .frame(maxWidth: .infinity, alignment: .leading)
      .background(.ultraThinMaterial)
      .clipShape(RoundedRectangle(cornerRadius: 15))
      .foregroundStyle(.white)
      // kalo datenya ganti
      .onChange(of: hourlyWeatherViewModel.selectedDate, { oldValue, newValue in
         print("trigger on change")
         Task{
            await hourlyWeatherViewModel.getHourlyForecast(location:locationViewModel.currentUserLocation!, date: hourlyWeatherViewModel.selectedDate)
         }
      })
      // biar check kalo location != nil
      .onChange(of: locationViewModel.currentUserLocation, { oldValue, newValue in
         //fetch hourly forecast
         Task{
            await hourlyWeatherViewModel.getHourlyForecast(location:locationViewModel.currentUserLocation!, date: hourlyWeatherViewModel.selectedDate)
         }
      })
//      .task {
//         await hourlyWeatherViewModel.getHourlyForecast(location:locationViewModel.currentUserLocation!, date: Date.now)
//      }
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
