//
//  Nano3App.swift
//  Nano3
//
//  Created by Andrew Oroh on 08/07/24.
//

import SwiftUI
import CoreLocation

@main
struct Nano3App: App {
    @StateObject var hourlyWeatherViewModel = HourlyWeatherViewModel.shared
    @StateObject var dailyWeatherViewModel = DailyWeatherViewModel.shared
    @StateObject var locationViewModel = LocationViewModel.shared
    @State var initialLocaiton : CLLocation?
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(){
                    Task{
                        await fetchInitialHourlyForecast()
                    }
                }
                .environmentObject(hourlyWeatherViewModel)
                .environmentObject(dailyWeatherViewModel)
        }
    }
    
    func fetchInitialHourlyForecast() async{

        initialLocaiton = locationViewModel.currentUserLocation
        
        if(initialLocaiton != nil){
            await hourlyWeatherViewModel.getHourlyForecast(location: locationViewModel.currentUserLocation!, date: Date.now)
        }
    }
}
