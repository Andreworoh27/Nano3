//
//  MovingCircle.swift
//  Nano3
//
//  Created by Paulus Michael on 16/07/24.
//

import Foundation
import SwiftUI

struct MovingCircle: Shape {
   var originOffset: CGPoint
   
   var animatableData: CGPoint.AnimatableData {
      get {
         CGPoint.AnimatableData(originOffset.x, originOffset.y)
      }
      set {
         originOffset.x = newValue.first
         originOffset.y = newValue.second
      }
   }
   
   func path(in rect: CGRect) -> Path {
      var path = Path()
      
      let adjustedX = rect.width * originOffset.x
      let adjustedY = rect.height * originOffset.y
      let smallestDimension = min(rect.width + 180, rect.height + 180)
      
      path.addArc(center: CGPoint(x: adjustedX, y: adjustedY), radius: smallestDimension / 2, startAngle: .zero, endAngle: .degrees(360), clockwise: true)
      
      return path
   }
}
