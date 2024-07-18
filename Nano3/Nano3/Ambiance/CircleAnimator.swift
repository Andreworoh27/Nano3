//
//  CircleAnimator.swift
//  Nano3
//
//  Created by Paulus Michael on 16/07/24.
//

import Foundation
import SwiftUI

class CircleAnimator: ObservableObject {
   class Circle: Identifiable {
      internal init(position: CGPoint, color: [Color]) {
         self.position = position
         self.color = color
      }
      
      var position: CGPoint
      let id = UUID().uuidString
      let color: [Color]
   }
   
   @Published private(set) var circles: [Circle] = []
   
   init(colors: [[Color]]) {
      circles = colors.map { color in
         Circle(position: CircleAnimator.generateRandomPosition(), color: color)
      }
   }
   
   func animate() {
      objectWillChange.send()
      for circle in circles {
         circle.position = CircleAnimator.generateRandomPosition()
      }
   }
   
   static func generateRandomPosition() -> CGPoint {
      CGPoint(x: CGFloat.random(in: 0...1), y: CGFloat.random(in: 0...1))
   }
}
