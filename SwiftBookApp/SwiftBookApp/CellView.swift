//
//  CellView.swift
//  SwiftBookApp
//
//  Created by Mykhailo Bondarenko on 17.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct CellView: View {
    var user: UserResponse
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            TopView(user: user)
            Text(user.text)
            .lineLimit(nil)
        }
    .padding()
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(user: userResponse[0])
    }
}
