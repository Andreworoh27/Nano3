//
//  HomepageView.swift
//  Nano3
//
//  Created by Paulus Michael on 12/07/24.
//

import SwiftUI
import WeatherKit

struct DailyWeatherView: View {
    @EnvironmentObject var dailyWeatherViewModel : DailyWeatherViewModel
    @EnvironmentObject var hourlyWeatherViewModel : HourlyWeatherViewModel
    @StateObject var locationViewModel = LocationViewModel.shared

    
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
                                .background(dailyWeatherViewModel.areDatesSameDay(hourlyWeatherViewModel.selectedDate!, forecast.date) ? Material.ultraThinMaterial.opacity(1) : Material.thinMaterial.opacity(0))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .onTapGesture {
                                    if(Date.isToday(inputDate: forecast.date)){
                                        DispatchQueue.main.async{
                                            hourlyWeatherViewModel.selectedDate = Date.now
                                        }
                                        
                                    }else{
                                        DispatchQueue.main.async{
                                            hourlyWeatherViewModel.selectedDate = forecast.date
                                        }
                                        
                                    }
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
            if let currentUserLocation = locationViewModel.currentUserLocation{
                await dailyWeatherViewModel.getDailyWeatherForecast(location: currentUserLocation)
            }
        }
    }
}

#Preview {
    DailyWeatherView()
        .environmentObject(HourlyWeatherViewModel.shared)
        .environmentObject(DailyWeatherViewModel.shared)
        .background(.black)
}
