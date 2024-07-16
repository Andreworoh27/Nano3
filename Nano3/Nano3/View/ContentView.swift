//
//  ContentView.swift
//  Nano3
//
//  Created by Andrew Oroh on 08/07/24.
//

import SwiftUI

struct ContentView: View {
   @EnvironmentObject var hourlyWeatherViewModel : HourlyWeatherViewModel
   
   var body: some View {
      ScrollView {
         if let hourlyForecast = hourlyWeatherViewModel.hourlyForecast{
            VStack(alignment: .leading){
               DailyWeatherView()
               CurrentWeatherView()
                  .background(
                     AmbianceBackgroundView(colors: [
                        [.yellow500, .green500],
                        [.blue500, .green500],
                        [.yellow500, .green500],
                     ])
                     .clipped()
                  )
                  .clipShape(RoundedRectangle(cornerRadius: 12))
                  .padding(.horizontal)
               
               HourlyWeatherView()
                  .padding()
            }
         }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
      .background(
         Image(.sunny)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
      )
      //      .background(
      //         AmbianceBackgroundView(colors: [
      //            [Color.blue300, Color.blue400],
      //            [Color.blue700, Color.blue800],
      //            [Color.blue300, Color.blue400],
      //            [Color.blue700, Color.blue800],
      //         ])
      //      )
   }
}

#Preview {
   ContentView()
      .environmentObject(HourlyWeatherViewModel.shared)
      .environmentObject(DailyWeatherViewModel.shared)
}
