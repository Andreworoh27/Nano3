//
//  HourlyWeatherView.swift
//  Nano3
//
//  Created by Paulus Michael on 12/07/24.
//
import SwiftUI

struct HourlyWeatherView: View {
    let hourlyWeatherData: [HourlyWeatherModel] = [
        HourlyWeatherModel(time: "06:00", uvi: "Low", symbolName: "moon.stars.fill", activitySymbolName: "figure.walk"),
        HourlyWeatherModel(time: "07:00", uvi: "Low", symbolName: "moon.stars.fill", activitySymbolName: "figure.walk"),
        HourlyWeatherModel(time: "08:00", uvi: "Low", symbolName: "moon.stars.fill", activitySymbolName: "figure.walk")
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "clock")
                Text("Available Playtime Hours: 6 AM - 6 PM")
                    .fontWeight(.bold)
            }
            
            Divider()
                .background(.white)
            
            ForEach(hourlyWeatherData) { weather in
                HStack(alignment: .center) {
                    Text(weather.time)
                        .fontWeight(.semibold)
                        .font(Font.system(size: 22))
                    
                    Spacer()
                    
                    Image(systemName: weather.symbolName)
                        .imageScale(.large)
                    
                    VStack(alignment: .leading) {
                        Text("UVI: \(weather.uvi)")
                            .font(.caption)
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 100, height: 5)
                    }
                    
                    Spacer()
                    
                    Image(systemName: weather.activitySymbolName)
                        .imageScale(.large)
                }
                
                Divider()
                    .background(.white)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .foregroundStyle(.white)
    }
}

#Preview {
   HourlyWeatherView()
      .background(.black)
}
