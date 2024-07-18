//
//  AmbianceBackgroundView.swift
//  Nano3
//
//  Created by Paulus Michael on 15/07/24.
//

import SwiftUI

struct AmbianceBackgroundView: View {
   @State private var timer = Timer.publish(every: AnimationProperties.timerDuration, on: .main, in: .common).autoconnect()
   
   var colors: [[Color]]
   
   @ObservedObject private var animator: CircleAnimator
   
   init(colors: [[Color]]) {
      self.colors = colors
      self._animator = ObservedObject(wrappedValue: CircleAnimator(colors: colors))
   }
   
   var body: some View {
      ZStack{
         ZStack{
            ForEach(animator.circles){circle in
               MovingCircle(originOffset: circle.position)
                  .foregroundStyle(LinearGradient(
                     colors: circle.color,
                     startPoint: UnitPoint(x: 0.0, y: 1.0),
                     endPoint: UnitPoint(x: 1.0, y: 1.0)
                  ))
            }
         }
      }
      .blur(radius: 25)
//      .background(GradientColors.backgroundColor)
      .onDisappear{
         timer.upstream.connect().cancel()
      }
      .onAppear{
         animateCircles()
         timer = Timer.publish(every: AnimationProperties.timerDuration, on: .main, in: .common).autoconnect()
      }
      .onReceive(timer){_ in
         animateCircles()
      }
   }
   
   private func animateCircles(){
      withAnimation(.easeInOut(duration: AnimationProperties.animationSpeed)) {
         animator.animate()
      }
   }
}

#Preview {
   AmbianceBackgroundView(colors: [[.yellow500, .green500], [.green500, .blue500]])
}
