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
    
    static func getDayString(inputDate : Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE" // EEEE gives the full day name
        return dateFormatter.string(from: inputDate)
    }
}
