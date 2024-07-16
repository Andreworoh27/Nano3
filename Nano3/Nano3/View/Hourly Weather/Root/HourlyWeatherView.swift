//
//  HourlyWeatherView.swift
//  Nano3
//
//  Created by Paulus Michael on 12/07/24.
//

import SwiftUI

struct HourlyWeatherView: View {
    @EnvironmentObject var hourlyWeatherViewModel : HourlyWeatherViewModel
   var locationViewModel = LocationViewModel.shared
   
   var body: some View {
      VStack(alignment: .leading) {
         HStack {
            Image(systemName: "clock")
            Text("Available Playtime Hours: 6 AM - 6 PM")
               .fontWeight(.bold)
         }
         
         if let hourlyForecast = hourlyWeatherViewModel.hourlyForecast {
             ForEach(hourlyForecast, id: \.hour){ hour in

               HourlyWeatherRowView(hourlyWeather: hour) /*HourlyWeather(hour: hour.date, condition: hour.condition, uvi: hour.uvIndex.value, uviDesc: hour.uvIndex.category.description, symbol: hour.symbolName))*/
            }
         }
      }
      .padding()
      .frame(maxWidth: .infinity, alignment: .leading)
      .background(.ultraThinMaterial)
      .clipShape(RoundedRectangle(cornerRadius: 15))
      .foregroundStyle(.white)
      .onChange(of: hourlyWeatherViewModel.selectedDate, { oldValue, newValue in
          
          if(locationViewModel.currentUserLocation != nil)
          {
              Task{
                 await hourlyWeatherViewModel.getHourlyForecast(location:locationViewModel.currentUserLocation!, date: hourlyWeatherViewModel.selectedDate!)
              }
          }
      })
   }
}

#Preview {
   HourlyWeatherView()
      .background(.black)
      .environmentObject(HourlyWeatherViewModel.shared)
}
