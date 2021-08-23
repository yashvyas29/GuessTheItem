//
//  Grid.swift
//  Grid
//
//  Created by global on 23/08/21.
//

import SwiftUI

struct Grid<Content: View>: View {
    let spacing: CGFloat
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var colors: [Color] {
        [.red, .green, .blue, .yellow, .pink, .purple, .black, .white, .orange, .accentColor, .gray]
    }

    var body: some View {
        ZStack {
            AngularGradient(colors: colors, center: .center).ignoresSafeArea()
            VStack(alignment: .leading, spacing: spacing) {
                ForEach(0..<rows, id: \.self) { row in
                    HStack(spacing: spacing) {
                        ForEach(0..<self.columns, id: \.self) { column in
                            self.content(row, column)
                                .padding()
                                .border(.black)
                        }
                    }
                }
                .fixedSize()
            }
            .padding()
        }
    }

    /*
    init(spacing: CGFloat = 10, rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.spacing = spacing
        self.rows = rows
        self.columns = columns
        self.content = content
    }
     */
}
