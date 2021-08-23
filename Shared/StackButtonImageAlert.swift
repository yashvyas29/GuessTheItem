//
//  StackButtonImageAlert.swift
//  StackButtonImageAlert
//
//  Created by global on 23/08/21.
//

import SwiftUI

struct StackButtonImageAlert: View {
    @State var isAlertPresented = false

    let colors: [Color] = [.red, .green, .blue, .yellow, .pink, .purple, .black, .white, .orange, .accentColor, .gray]

    var body: some View {
        ZStack {
            Color.yellow.edgesIgnoringSafeArea(.all)
            /*
            LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing)
            RadialGradient(colors: colors, center: .center, startRadius: 20, endRadius: 200)
            AngularGradient(colors: colors, center: .center)
            if #available(iOS 15.0, *) {
                EllipticalGradient(colors: colors)
            }
             */
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text("Hello")
                        Text("Yash")
                        Text("!")
                    }
                    HStack {
                        Text("Welcome")
                        Text("to")
                        Text("SwiftUI")
                    }
                    HStack {
                        Button("Press Me") {
                            print("Button got pressed.")
                        }
                        Button {
                            self.isAlertPresented = true
                        } label: {
                            Image(systemName: "pencil").renderingMode(.original)
                            Text("Alert")
                        }
                        .background(Color.red)
                        .clipShape(Capsule())
                        .alert(isPresented: $isAlertPresented) {
                            Alert(title: Text("Alert"), message: Text("Alert message"), dismissButton: .default(Text("OK")))
                        }
                        // Available from iOS 15.0
                        // .alert("Alert", isPresented: $isAlertPresented) {}
                    }
                    Spacer()
                }
                .padding()
                /*
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                .background(Color.red)
                 */
                Spacer()
            }
        }
    }
}
