//
//  ContentView.swift
//  Shared
//
//  Created by global on 22/08/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // StackButtonImageAlert()
        // GuessTheItemView()
        // CustomBinding()
        RockPaperScissors()
        /*
        Grid(spacing: 10, rows: 4, columns: 2) { row, col in
            HStack {
                Image(systemName: "\(row * 2 + col).circle")
                Text("Row\(row) Column\(col)")
            }
        }
         */
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
