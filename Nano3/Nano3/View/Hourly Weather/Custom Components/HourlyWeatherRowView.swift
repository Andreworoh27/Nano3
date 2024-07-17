//
//  HourlyWeatherRowView.swift
//  Nano3
//
//  Created by Paulus Michael on 15/07/24.
//

import SwiftUI

struct HourlyWeatherRowView: View {
   var hourlyWeather: HourlyWeather
   
   var body: some View {
      Divider()
         .background(.white)
      HStack(alignment: .center) {
         Text(hourlyWeather.hour, style: .time)
            .fontWeight(.medium)
            .font(Font.system(size: 22))
            .frame(width: 75, alignment: .leading)
         
         Spacer()
         
         VStack {
            HStack {
               Image(systemName: "\(hourlyWeather.symbol).fill")
                  .renderingMode(.original)
                  .imageScale(.large)
                  .frame(width: 24)
               
               VStack(alignment: .leading) {
                  Text("UVI: \(hourlyWeather.uviDesc)")
                     .font(.system(size: 12))
                     .fontWeight(.semibold)
                  ProgressView(value: Double(hourlyWeather.uvi), total: 10)
                     .frame(width: 100)
                     .tint(hourlyWeather.uviColor)
                     .scaleEffect(x: 1, y: 1.5)
               }
            }
         }
         
         Spacer()
         
         Image(systemName: hourlyWeather.walkable ? "figure.walk" : "nosign").imageScale(.large)
      }
      
      //               if index < hourlyWeatherData.count - 1 {
      //                  Divider()
      //                     .background(.white)
      //               }
   }
}

#Preview {
   HourlyWeatherRowView(hourlyWeather: HourlyWeather(hour: Date(), condition: .clear, uvi: 5, uviDesc: "High", symbol: "sun.max"))
}
