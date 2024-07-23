//
//  ContentView.swift
//  Nano3
//
//  Created by Andrew Oroh on 08/07/24.
//

import SwiftUI

struct ContentView: View {
   @EnvironmentObject var hourlyWeatherViewModel : HourlyWeatherViewModel
   @ObservedObject var notificationManager = NotificationManager()
   
   var body: some View {
      VStack{
         if hourlyWeatherViewModel.isLoading{
            ProgressView()
               .frame(maxWidth: .infinity, maxHeight: .infinity)
            
         }else{
            ScrollView {
               if hourlyWeatherViewModel.hourlyForecast != nil {
                  VStack(alignment: .leading){
                     DailyWeatherView()
                     
                     CurrentWeatherView()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(.horizontal)
                     
                     HourlyWeatherView()
                        .padding()
                  }
               }
            }
         }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
      .onAppear(){
         //         print("Notification")
         if !UserDefaults.standard.bool(forKey: "isNotifAuthGiven") {
            notificationManager.requestNotifPermission()
         }
      }
      .background(
         Image(.sunny)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
      )
   }
}

#Preview {
   ContentView()
      .environmentObject(HourlyWeatherViewModel.shared)
      .environmentObject(DailyWeatherViewModel.shared)
      .environmentObject(CurrentWeatherViewModel.shared)
}
