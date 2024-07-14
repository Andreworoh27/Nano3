//
//  DayIconView.swift
//  Nano3
//
//  Created by Paulus Michael on 14/07/24.
//

import SwiftUI

struct DayIconView: View {
   var date: Date
   var symbolName: String
   
   var body: some View {
      VStack{
         if(Date.isToday(inputDate: date)){
            Text("Today")
               .font(.caption)
         } else{
            Text("\(Date.getDayString(inputDate: date))")
               .font(.caption)
         }
         
         Image(systemName: "\(symbolName).fill")
            .renderingMode(.original)
            .imageScale(.large)
      }
      .padding(6)
      .frame(maxWidth: .infinity)
      .clipShape(RoundedRectangle(cornerRadius: 12))
   }
}

#Preview {
   DayIconView(date: Date(), symbolName: "sun.fill")
}
