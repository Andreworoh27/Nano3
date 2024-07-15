//
//  HourlyWeatherView.swift
//  Nano3
//
//  Created by Paulus Michael on 12/07/24.
//

import SwiftUI

struct HourlyWeatherView: View {
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

               HourlyWeatherRowView(hourlyWeather: HourlyWeather(hour: hour.date, condition: hour.condition, uvi: hour.uvIndex.value, uviDesc: hour.uvIndex.category.description, symbol: hour.symbolName))
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

#Preview {
   HourlyWeatherView()
      .background(.black)
}
