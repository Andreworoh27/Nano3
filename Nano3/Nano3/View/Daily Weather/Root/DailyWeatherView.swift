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
   @StateObject var dailyWeatherViewModel = DailyWeatherViewModel()
   @Binding var selectedDate: Date
   
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
                        .background(dailyWeatherViewModel.areDatesSameDay(selectedDate, forecast.date) ? Material.ultraThinMaterial.opacity(1) : Material.thinMaterial.opacity(0))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .onTapGesture {
                           selectedDate = forecast.date
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
         if (locationViewModel.currentUserLocation != nil){
//            Task{
               await dailyWeatherViewModel.getDailyWeatherForecast(location: locationViewModel.currentUserLocation!)
//            }
         }else{
            print("No city for daily")
         }
      }
   }
}

#Preview {
   DailyWeatherView(selectedDate: .constant(Date()))
      .background(.black)
}
