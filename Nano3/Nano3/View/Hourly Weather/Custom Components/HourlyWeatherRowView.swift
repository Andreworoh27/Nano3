//
//  HourlyWeatherRowView.swift
//  Nano3
//
//  Created by Paulus Michael on 15/07/24.
//

import SwiftUI

struct HourlyWeatherRowView: View {
   var date: Date
   var symbol: String
   var uvi: Int
   
   var body: some View {
      Divider()
         .background(.white)
      
      HStack(alignment: .center) {
         Text("\(date.formatted(date: .omitted, time: .shortened))")
            .fontWeight(.semibold)
            .font(Font.system(size: 22))
         
         Spacer()
         
         Image(systemName: "\(symbol).fill")
            .renderingMode(.original)
            .imageScale(.large)
         
         VStack(alignment: .leading) {
            Text("UVI: \(uvi)")
               .font(.caption)
            RoundedRectangle(cornerRadius: 25)
               .frame(width: 100, height: 5)
         }
         
         Spacer()
         
         //                  Image(systemName: weather.walkable ? "figure.walk" : "nosign")
         //                     .imageScale(.large)
      }
      
      //               if index < hourlyWeatherData.count - 1 {
      //                  Divider()
      //                     .background(.white)
      //               }
   }
}

#Preview {
   HourlyWeatherRowView(date: Date(), symbol: "sun.max", uvi: 3)
}
