//
//  HourlyWeatherView.swift
//  Nano3
//
//  Created by Paulus Michael on 12/07/24.
//

import SwiftUI

struct HourlyWeatherView: View {
   var body: some View {
      VStack(alignment: .leading){
         HStack{
            Image(systemName: "clock")
            Text("Available Playtime Hours: 6 AM - 6 PM")
               .fontWeight(.bold)
         }
         
         Divider()
            .background(.white)
         
         HStack(alignment: .center){
            Text("06:00")
               .fontWeight(.semibold)
               .font(Font.system(size: 22))
            
            Spacer()
            
            Image(systemName: "moon.stars.fill")
               .imageScale(.large)
            
            VStack(alignment: .leading){
               Text("UVI: Low")
                  .font(.caption)
               RoundedRectangle(cornerRadius: 25)
                  .frame(width: 100, height: 5)
            }
            
            Spacer()
            
            Image(systemName: "figure.walk")
               .imageScale(.large)
         }
         
         Divider()
            .background(.white)
         
         HStack{
            Text("07:00")
               .fontWeight(.semibold)
               .font(Font.system(size: 22))
            
            Spacer()
            
            Image(systemName: "moon.stars.fill")
               .imageScale(.large)
            
            VStack(alignment: .leading){
               Text("UVI: Low")
                  .font(.caption)
               RoundedRectangle(cornerRadius: 25)
                  .frame(width: 100, height: 5)
            }
            
            Spacer()
            
            Image(systemName: "figure.walk")
               .imageScale(.large)
         }
         
         Divider()
            .background(.white)
         
         HStack{
            Text("08:00")
               .fontWeight(.semibold)
               .font(Font.system(size: 22))
            
            Spacer()
            
            Image(systemName: "moon.stars.fill")
               .imageScale(.large)
            
            VStack(alignment: .leading){
               Text("UVI: Low")
                  .font(.caption)
               RoundedRectangle(cornerRadius: 25)
                  .frame(width: 100, height: 5)
            }
            
            Spacer()
            
            Image(systemName: "figure.walk")
               .imageScale(.large)
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
