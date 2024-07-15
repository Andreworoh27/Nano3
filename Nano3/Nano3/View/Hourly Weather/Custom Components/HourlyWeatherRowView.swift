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
            .fontWeight(.semibold)
            .font(Font.system(size: 22))
         
         Spacer()
         
         Image(systemName: "\(hourlyWeather.precipitation.symbolName).fill")
            .renderingMode(.original)
            .imageScale(.large)
         
         VStack(alignment: .leading) {
            Text("UVI: \(hourlyWeather.uvi)")
               .font(.caption)
            RoundedRectangle(cornerRadius: 25)
               .frame(width: 100, height: 5)
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
   HourlyWeatherRowView(hourlyWeather: HourlyWeather( parsedData: ParsedHourlyWeatherData(time: Calendar.current.date(bySettingHour: 6, minute:0, second:0, of: Date())!, precipitation: Precipitation.none, uvi: 2)))
}
