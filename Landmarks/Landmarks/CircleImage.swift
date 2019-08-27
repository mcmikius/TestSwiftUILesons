//
//  CircleImage.swift
//  Landmarks
//
//  Created by Mykhailo Bondarenko on 27.08.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
        .clipShape(Circle())
        .overlay(
        Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
    }
}

#if DEBUG

struct CircleImage_Preview: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
#endif