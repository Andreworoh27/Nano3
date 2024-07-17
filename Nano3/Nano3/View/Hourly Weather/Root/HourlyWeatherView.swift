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
         if let hourlyForecast = hourlyWeatherViewModel.hourlyForecast {
            HStack {
               Image(systemName: "clock")
               Text("\(hourlyWeatherViewModel.selectedDate!.formatted(date: .complete, time: .omitted))")
                  .fontWeight(.medium)
                  .font(.system(size: 16))
            }
            
            ForEach(hourlyForecast, id: \.hour){ hour in
               HourlyWeatherRowView(hourlyWeather: hour)
            }
         }
      }
      .padding()
      .frame(maxWidth: .infinity, alignment: .leading)
      .background(.ultraThinMaterial.opacity(0.5))
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
