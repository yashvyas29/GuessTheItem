//
//  ButtonAnimation.swift
//  ButtonAnimation
//
//  Created by global on 27/08/21.
//

import SwiftUI

struct ButtonAnimation: View {
    @State var animationAmount = 1.0

    var body: some View {
        VStack {
            /*
            Spacer()
            Stepper("Scale amount", value: $animationAmount.animation(
                Animation.easeInOut(duration: 1)
                        .repeatCount(3, autoreverses: true)
            ), in: 1...10)
                .padding()
                .frame(maxWidth: 250)
            Spacer()
             */
            Button("Tap Me") {
                //self.animationAmount += 1
                withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                    self.animationAmount += 360
                }
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.yellow, lineWidth: 5)
                    .opacity(1)
                    /*
                    .scaleEffect(animationAmount)
                    .opacity(Double(2 - animationAmount))
                    .animation(
                        Animation.easeOut(duration: 2)
                            .delay(0.5)
                            .repeatForever(autoreverses: false)
                    ) */
            )
            //.scaleEffect(animationAmount)
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
            //.animation(.interpolatingSpring(stiffness: 50, damping: 1))
            /*
            .animation(
                Animation.easeInOut(duration: 2)
                        .repeatCount(3, autoreverses: true)
            )
             */
            //Spacer()
        }
        .onAppear {
            //self.animationAmount = 2
        }
    }
}
