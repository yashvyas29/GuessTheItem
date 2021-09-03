//
//  StepperSlider.swift
//  StepperSlider
//
//  Created by global on 25/08/21.
//

import SwiftUI

struct StepperSlider: View {
    @State private var value = 8.0

    var body: some View {
        Form {
            Stepper(value: $value, in: 4...12, step: 0.25) {
                Text("\(value, specifier: "%g") hours")
            }
            .scaleEffect()
            .blur(radius: 1)
            .animation(.default)
            Slider(value: $value, in: 4...12, step: 0.25)
        }
    }
}
