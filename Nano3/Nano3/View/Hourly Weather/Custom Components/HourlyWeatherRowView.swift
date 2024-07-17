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
   
         
         HStack {
            Image(systemName: "\(hourlyWeather.symbol).fill")
               .renderingMode(.original)
               .imageScale(.large)
               .frame(width: 24)
               .padding(.leading)
               .padding(.trailing, 32)
            
            VStack(alignment: .leading) {
               Text("UVI: \(hourlyWeather.uviDesc)")
                  .font(.system(size: 12))
                  .fontWeight(.semibold)
               
               SegmentedProgressView(value: Double(hourlyWeather.uvi), maxValue: 10, segmentCount: 5, color: hourlyWeather.uviColor)
                  .frame(width: 100)
            }
            
            Spacer()
            
         }.frame(height: 30)
         
         Spacer()
         
         Image(systemName: "figure.walk")
            .imageScale(.large)
            .opacity(hourlyWeather.walkable ? 1 : 0)
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
