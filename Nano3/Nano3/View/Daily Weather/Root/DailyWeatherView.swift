//
//  HomepageView.swift
//  Nano3
//
//  Created by Paulus Michael on 12/07/24.
//

import SwiftUI
import WeatherKit

struct DailyWeatherView: View {
   @StateObject var locationViewModel = LocationViewModel()
   @StateObject var dailyWeatherViewModel = DailyWeatherViewModel()
   @State var selectedDate: Date = Date()
   
   var body: some View {
      VStack(alignment: .leading){
         Text("\(locationViewModel.cityName)")
            .fontWeight(.semibold)
            .foregroundStyle(.white)
         
         HStack{
            if let dailyForecast = dailyWeatherViewModel.dailyForecast {
               ForEach(dailyForecast, id: \.date){ forecast in
                  DayIconView(date: forecast.date, symbolName: forecast.symbolName)
                     .background(dailyWeatherViewModel.areDatesSameDay(selectedDate, forecast.date) ? Material.ultraThinMaterial.opacity(1) : Material.thinMaterial.opacity(0))
                     .clipShape(RoundedRectangle(cornerRadius: 12))
                     .onTapGesture {
                        selectedDate = forecast.date
                     }
                  
               }
               .padding(.vertical, 19)
               .foregroundStyle(.white)
            }
         }
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding([.top, .horizontal])
      .onChange(of: locationViewModel.currentUserLocation, {
         if (locationViewModel.currentUserLocation != nil){
            Task{
               await dailyWeatherViewModel.getDailyWeatherForecast(location: locationViewModel.currentUserLocation!)
            }
         }else{
            print("No city")
         }
      })
   }
}

#Preview {
   DailyWeatherView()
      .background(.black)
}
