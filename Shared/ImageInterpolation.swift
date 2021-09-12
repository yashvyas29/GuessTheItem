//
//  ImageInterpolation.swift
//  GuessTheItem
//
//  Created by global on 12/09/21.
//

import SwiftUI

struct ImageInterpolation: View {
    var body: some View {
        Image("alien_cartoon")
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ImageInterpolation_Previews: PreviewProvider {
    static var previews: some View {
        ImageInterpolation()
    }
}
