//
//  SegmentedProgressView.swift
//  Nano3
//
//  Created by Paulus Michael on 17/07/24.
//

import SwiftUI

struct SegmentedProgressView: View {
   var value: Double
   var maxValue: Double = 10.0
   var segmentCount: Int = 5
   var color: Color
   var desc: String
   
   private var filledSegments: Int {
      switch desc {
      case NSLocalizedString("Low", comment: ""):
         return 1
      case NSLocalizedString("Moderate", comment: ""):
         return 2
      case NSLocalizedString("High", comment: ""):
         return 3
      case NSLocalizedString("Very High", comment: ""):
         return 4
      case NSLocalizedString("Extreme", comment: ""):
         return 5
      default:
         return 0
      }
   }
   
   var body: some View {
      GeometryReader { geometry in
         ZStack(alignment: .leading) {
            HStack(spacing: 1) {
               ForEach(0..<segmentCount, id: \.self) { _ in
                  Rectangle()
                     .fill(Color.white.opacity(0.7))
                     .frame(width: (geometry.size.width - CGFloat(segmentCount - 1) * 1) / CGFloat(segmentCount))
               }
            }
            HStack(spacing: 1) {
               ForEach(0..<filledSegments, id: \.self) { index in
                  Rectangle()
                     .fill(self.color)
                     .frame(width: (geometry.size.width - CGFloat(segmentCount - 1) * 1) / CGFloat(segmentCount))
               }
            }
         }
         .frame(height: 8)
         .background(Color.white)
         .clipShape(RoundedRectangle(cornerRadius: 35))
         .overlay(
            RoundedRectangle(cornerRadius: 35)
               .stroke(Color.white, lineWidth: 1)
         )
      }
      .frame(height: 10)
   }
}



#Preview {
   SegmentedProgressView(value: 3, color: .green, desc: "Low")
      .frame(width: 100)
}
