//
//  DateExtension.swift
//  Nano3
//
//  Created by Andrew Oroh on 13/07/24.
//

import Foundation

extension Date{
   static func isToday(inputDate : Date)->Bool{
      if(Calendar.current.isDate(inputDate, equalTo: Date.now, toGranularity: Calendar.Component.day)){
         return true
      }
      return false
   }
   
   static func getDayStringShort(inputDate : Date) -> String{
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "EE" // EEEE gives the full day name
      return dateFormatter.string(from: inputDate)
   }
   
   static func getSpecificDate(hour: Int, date: Date) -> Date? {
      let calendar = Calendar.current
      var components = calendar.dateComponents([.year, .month, .day], from: date)
      components.hour = hour
      components.minute = 0
      components.second = 0
      return calendar.date(from: components)
   }
}
