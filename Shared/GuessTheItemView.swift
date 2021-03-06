//
//  GuessTheItemView.swift
//  GuessTheItemView
//
//  Created by global on 23/08/21.
//

import SwiftUI

struct GuessTheItemView: View {
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria",
                     "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0..<4)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State private var scoreValue = 0

    let questionScore = 10

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of:")
                    Text(countries[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.black)
                }

                Grid(spacing: 10, rows: 2, columns: 2) { row, col in
                    Button(action: {
                        self.itemTapped(row * 2 + col)
                    }) {
                        ItemImage(name: self.countries[row * 2 + col])
                    }
                }
                .fixedSize()

                // Need to change correctAnswer range to 0..<3
                /*
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.itemTapped(number)
                    }) {
                        ItemImage(name: self.countries[number])
                    }
                }
                 */

                Text(scoreMessage).foregroundColor(.white)
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text(scoreMessage), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }

    func itemTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            scoreValue += questionScore
            scoreMessage = "Your score is \(scoreValue)"
        } else {
            scoreTitle = "Wrong"
            scoreMessage = "That???s the flag of \(countries[number]),"
        }

        showingScore = true
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0..<4)
    }
}

private struct ItemImage: View {
    let name: String

    var body: some View {
        Image(name)
            .resizable()
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 132)
    }
}
