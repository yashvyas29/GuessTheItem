//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by global on 25/08/21.
//

import SwiftUI

struct RockPaperScissors: View {
    let options = ["Rock", "Paper", "Scissors"]

    @State var currentOption = Int.random(in: 0..<3)
    @State var nextOption = 0
    @State var shouldWin = Bool.random()
    @State var score = 0

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("Current option is \(options[currentOption]).")
            Text("This is a \(shouldWin ? "Win" : "Loose") game.")
            Text("Your score is \(score).")
            List(options.indices, id: \.self) { index in
                HStack {
                    Spacer()
                    Button {
                        nextOption = currentOption + 1
                        if nextOption == options.count {
                            // Last option will reset to 0 for circulating it
                            nextOption = 0
                        }
                        if index == nextOption {
                            // In a win game user wins if he selected one option greater than the provided option
                            score = shouldWin ? score + 1 : score - 1
                        } else {
                            score = !shouldWin ? score + 1 : score - 1
                        }
                        changeOption()
                    } label: {
                        Text(options[index])
                    }
                    .modifier(OptionButtonStyle())
                    Spacer()
                }
                .padding()
            }
            .listStyle(GroupedListStyle())
        }
    }

    private func changeOption() {
        currentOption = Int.random(in: 0..<3)
        shouldWin = Bool.random()
    }

    private struct OptionButtonStyle: ViewModifier {
        func body(content: Content) -> some View {
            content
                .padding()
                .frame(minWidth: 200)
                .foregroundColor(Color.white)
                .background(Color.black)
                .clipShape(Capsule())
        }
    }
}
