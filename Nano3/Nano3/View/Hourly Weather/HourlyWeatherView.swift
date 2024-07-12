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
            Image(systemName: "calendar")
            Text("HOURLY FORECAST")
         }
         
         Divider()
            .background(.white)
         
         HStack{
            Text("Now")
               .fontWeight(.semibold)
               .font(Font.system(size: 22))
            
            Spacer()
            
            Image(systemName: "moon.stars.fill")
               .imageScale(.large)
            
            Text("27")
               .fontWeight(.semibold)
               .font(Font.system(size: 22))
               .padding(.trailing, 24)
            
         }
         
         Divider()
            .background(.white)
         
         HStack{
            Text("01.00")
               .fontWeight(.semibold)
               .font(Font.system(size: 22))
            
            Spacer()
            
            Image(systemName: "moon.stars.fill")
               .imageScale(.large)
            
            Text("27")
               .fontWeight(.semibold)
               .font(Font.system(size: 22))
               .padding(.trailing, 24)
         }
         
         Divider()
            .background(.white)
         
         HStack{
            Text("02.00")
               .fontWeight(.semibold)
               .font(Font.system(size: 22))
            
            Spacer()
            
            Image(systemName: "moon.stars.fill")
               .imageScale(.large)
            
            Text("27")
               .fontWeight(.semibold)
               .font(Font.system(size: 22))
               .padding(.trailing, 24)
         }
      }
      .padding()
      .frame(maxWidth: .infinity, alignment: .leading)
      .background(.white.opacity(0.2))
      .clipShape(RoundedRectangle(cornerRadius: 15))
      .foregroundStyle(.white)
   }
}

#Preview {
   HourlyWeatherView()
      .background(.black)
}
