//
//  GradientColors.swift
//  Nano3
//
//  Created by Paulus Michael on 16/07/24.
//

import Foundation
import SwiftUI

enum GradientColors {
   static var all: [[Color]]{
      [
         [Color.green500, Color.yellow500],
         [Color.blue500, Color.green500],
         [Color.green500, Color.yellow500],
         [Color.blue500, Color.green500],
      ]
   }
   
   static var backgroundColor: Color{
      Color.blue
   }
}
