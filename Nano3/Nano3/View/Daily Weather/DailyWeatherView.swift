//
//  HomepageView.swift
//  Nano3
//
//  Created by Paulus Michael on 12/07/24.
//

import SwiftUI

struct DailyWeatherView: View {
   var body: some View {
      VStack(alignment: .leading){
         Text("Tangerang")
            .fontWeight(.semibold)
            .foregroundStyle(.white)
         
         HStack{
            VStack{
               Text("Today")
                  .font(.subheadline)
               
               Image(systemName: "sun.max.fill")
                  .renderingMode(.original)
                  .imageScale(.large)
            }
            .padding(6)
            .background(.white.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .frame(maxWidth: .infinity)
            
            VStack{
               Text("Thu")
                  .font(.subheadline)
               
               Image(systemName: "sun.max.fill")
                  .renderingMode(.original)
                  .imageScale(.large)
            }
            .padding(6)
            .frame(maxWidth: .infinity)
            
            VStack{
               Text("Fri")
                  .font(.subheadline)
               
               Image(systemName: "sun.max.fill")
                  .renderingMode(.original)
                  .imageScale(.large)
            }
            .padding(6)
            .frame(maxWidth: .infinity)
            
            VStack{
               Text("Sat")
                  .font(.subheadline)
               Image(systemName: "sun.max.fill")
                  .renderingMode(.original)
                  .imageScale(.large)
            }
            .padding(6)
            .frame(maxWidth: .infinity)
            
            VStack{
               Text("Sun")
                  .font(.subheadline)
               Image(systemName: "sun.max.fill")
                  .renderingMode(.original)
                  .imageScale(.large)
            }
            .padding(6)
            .frame(maxWidth: .infinity)
            
            VStack{
               Text("Mon")
                  .font(.subheadline)
               
               Image(systemName: "sun.max.fill")
                  .renderingMode(.original)
                  .imageScale(.large)
            }
            .padding(6)
            .frame(maxWidth: .infinity)
         }
         .padding(.vertical, 19)
         .foregroundStyle(.white)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding()
   }
}

#Preview {
   DailyWeatherView()
      .background(.black)
}
