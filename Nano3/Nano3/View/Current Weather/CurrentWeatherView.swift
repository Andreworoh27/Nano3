//
//  CurrentWeatherView.swift
//  Nano3
//
//  Created by Paulus Michael on 12/07/24.
//

import SwiftUI

struct CurrentWeatherView: View {
   var body: some View {
      HStack(alignment: .bottom){
         VStack(alignment: .leading){
            Text("Wednesday")
               .font(Font.system(size: 24))
            Text("July 10th")
               .font(Font.system(size: 12))
            
            Text("")
            
            HStack(alignment: .center) {
               Image(systemName: "moon.stars.fill")
                  .imageScale(.large)
               Text("30 C")
                  .font(Font.system(size: 24))
            }
            
            Text("H: 32")
               .font(Font.system(size: 20))
            Text("L: 28")
               .font(Font.system(size: 20))
         }
         
         Image(.ilustrasiPlaceholder)
      }
      .foregroundStyle(.white)
      .padding()
   }
}

#Preview {
   CurrentWeatherView()
}
