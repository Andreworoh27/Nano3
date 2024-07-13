//
//  CurrentWeatherView.swift
//  Nano3
//
//  Created by Paulus Michael on 12/07/24.
//

import SwiftUI

struct CurrentWeatherView: View {
   var body: some View {
      ZStack {
         VStack(alignment: .leading){
            VStack(alignment: .leading) {
               Text("Best times to play outdoors")
                  .fontWeight(.semibold)
                  .font(.title3)
               
               Text("Today on July 10th")
                  .padding(.bottom)
               
               HStack {
                  Image(systemName: "figure.walk")
                     .imageScale(.large)
                  Text("06.00 - 11.00")
                     .font(.title)
                     .fontWeight(.bold)
               }
               Text("Enjoy outdoor playtime with your kids during these safe UV hours, with gentler sun and less risk of sunburn!")
                  .font(.caption)
            }
            .frame(width: 275)
         }
         .frame(maxWidth: .infinity, alignment: .leading)
         .foregroundStyle(.white)
         .padding()
         .background(.ultraThinMaterial)
         .clipShape(RoundedRectangle(cornerRadius: 12))
      }
   }
}

#Preview {
   CurrentWeatherView()
      .background(.blue)
}
