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
   var body: some View {
      VStack(alignment: .leading){
         Text("\(locationViewModel.cityName)")
            .fontWeight(.semibold)
            .foregroundStyle(.white)
         
         if(dailyWeatherViewModel.dailyForecast?.count ?? -1 < 0){
            HStack{
               VStack{
                  Text("Today")
                     .font(.subheadline)
                  
                  Image(systemName: "sun.max.fill")
                     .renderingMode(.original)
                     .imageScale(.large)
               }
               .padding(6)
               .background(.white.opacity(0.3))
               .clipShape(RoundedRectangle(cornerRadius: 12))
               .frame(maxWidth: .infinity)
               
               VStack{
                  Text("Thu")
                     .font(.subheadline)
                  
                  Image(systemName: "sun.max.fill")
                     .renderingMode(.original)
                     .imageScale(.large)
               }
               .padding(6)
               .frame(maxWidth: .infinity)
               
               VStack{
                  Text("Fri")
                     .font(.subheadline)
                  
                  Image(systemName: "sun.max.fill")
                     .renderingMode(.original)
                     .imageScale(.large)
               }
               .padding(6)
               .frame(maxWidth: .infinity)
               
               VStack{
                  Text("Sat")
                     .font(.subheadline)
                  Image(systemName: "sun.max.fill")
                     .renderingMode(.original)
                     .imageScale(.large)
               }
               .padding(6)
               .frame(maxWidth: .infinity)
               
               VStack{
                  Text("Sun")
                     .font(.subheadline)
                  Image(systemName: "sun.max.fill")
                     .renderingMode(.original)
                     .imageScale(.large)
               }
               .padding(6)
               .frame(maxWidth: .infinity)
               
               VStack{
                  Text("Mon")
                     .font(.subheadline)
                  
                  Image(systemName: "sun.max.fill")
                     .renderingMode(.original)
                     .imageScale(.large)
               }
               .padding(6)
               .frame(maxWidth: .infinity)
            }
            .padding(.vertical, 19)
            .foregroundStyle(.white)
         }
         else{
            HStack{
               ForEach(dailyWeatherViewModel.dailyForecast!, id: \.date){ forecast in
                  VStack{
                     if(Date.isToday(inputDate: forecast.date)){
                        Text("Today")
                           .font(.subheadline)
                     } else{
                        Text("\(Date.getDayString(inputDate: forecast.date))")
                           .font(.subheadline)
                     }
                     
                     Image(systemName: "sun.max.fill")
                        .renderingMode(.original)
                        .imageScale(.large)
                  }
                  .padding(6)
                  .background(.white.opacity(0.3))
                  .clipShape(RoundedRectangle(cornerRadius: 12))
                  .frame(maxWidth: .infinity)
               }
            }
            .padding(.vertical, 19)
            .foregroundStyle(.white)
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
