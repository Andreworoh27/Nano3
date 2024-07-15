//
//  ContentView.swift
//  Nano3
//
//  Created by Andrew Oroh on 08/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                DailyWeatherView()
                //             CurrentWeatherView(
                //                         viewModel: CurrentWeatherViewModel(
                //                             title: "Best times to play outdoors",
                //                             date: "Today on July 10th",
                //                             timeRange: "06:00 - 11:00",
                //                             description: "Enjoy outdoor playtime with your kids during these safe UV hours, with gentler sun and less risk of sunburn!"
                //                         )
                //                     )
                //            .padding(.horizontal)
                
                HourlyWeatherView()
                    .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(.blue)
    }
}

#Preview {
    ContentView()
        .environmentObject(HourlyWeatherViewModel.shared)
        .environmentObject(DailyWeatherViewModel.shared)
}
