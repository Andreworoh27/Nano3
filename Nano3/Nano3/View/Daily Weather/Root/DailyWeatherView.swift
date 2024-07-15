//
//  HomepageView.swift
//  Nano3
//
//  Created by Paulus Michael on 12/07/24.
//

import SwiftUI
import WeatherKit

struct DailyWeatherView: View {
   @StateObject var locationViewModel = LocationViewModel.shared
   @StateObject var dailyWeatherViewModel = DailyWeatherViewModel.shared
   @StateObject var hourlyWeatherViewModel = HourlyWeatherViewModel.shared
   //   @Binding var selectedDate: Date
   
   var body: some View {
      VStack(alignment: .center){
         Text("Currently viewing weather for")
            .foregroundStyle(.white)
            .font(.caption)
         
         Text("\(locationViewModel.cityName)")
            .fontWeight(.semibold)
            .foregroundStyle(.white)
         
         ScrollView(.horizontal, showsIndicators: false) {
            HStack{
               if let dailyForecast = dailyWeatherViewModel.dailyForecast {
                  ForEach(dailyForecast, id: \.date){ forecast in
                     DayIconView(date: forecast.date, symbolName: forecast.symbolName)
                        .background(dailyWeatherViewModel.areDatesSameDay(hourlyWeatherViewModel.selectedDate, forecast.date) ? Material.ultraThinMaterial.opacity(1) : Material.thinMaterial.opacity(0))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .onTapGesture {
                           hourlyWeatherViewModel.selectedDate = forecast.date
                           print(hourlyWeatherViewModel.selectedDate)
                        }
                        .frame(width: 50)
                     
                  }
                  .padding(.vertical, 19)
                  .foregroundStyle(.white)
               }
            }
         }
      }
      .padding([.top, .leading])
      .task {
         //            Task{
         if let currentUserLocation = locationViewModel.currentUserLocation{
            await dailyWeatherViewModel.getDailyWeatherForecast(location: currentUserLocation)
         }
      }
   }
}

#Preview {
   DailyWeatherView()
      .background(.black)
}
