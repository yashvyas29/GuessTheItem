//
//  ContextMenu.swift
//  GuessTheItem
//
//  Created by global on 12/09/21.
//

import SwiftUI

struct ContextMenu: View {
    @State private var backgroundColor = Color.red

    var body: some View {
        VStack {
            Text("Change Color")
                .padding()
                .contextMenu {
                    Button(action: {
                        self.backgroundColor = .red
                    }) {
                        Text("Red")
                        if backgroundColor == .red {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.red)
                        }
                    }

                    Button(action: {
                        self.backgroundColor = .green
                    }) {
                        if backgroundColor == .green {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.green)
                        }
                        Text("Green")
                    }

                    Button(action: {
                        self.backgroundColor = .blue
                    }) {
                        Text("Blue")
                        if backgroundColor == .blue {
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.blue)
                        }
                    }
                }
                .background(backgroundColor)
                .clipShape(Capsule())
        }
    }
}

struct ContextMenu_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenu()
    }
}
