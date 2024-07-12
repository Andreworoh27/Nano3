//
//  ContentView.swift
//  Nano3
//
//  Created by Andrew Oroh on 08/07/24.
//

import SwiftUI

struct ContentView: View {
   var body: some View {
      VStack(alignment: .leading){
         DailyWeatherView()
         
         CurrentWeatherView()
         
         Divider()
         
         VStack(alignment: .leading){
            Text("Hourly Forecast")
            HStack{
               Text("Jam")
               
               Spacer()
               
               Text("Suhu")
            }
         }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
      .background(.blue)
   }
}

#Preview {
   ContentView()
}
