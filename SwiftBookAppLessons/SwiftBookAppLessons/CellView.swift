//
//  CellView.swift
//  SwiftBookAppLessons
//
//  Created by Mykhailo Bondarenko on 8/15/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct CellView: View {
    var user: UserResponse
    var body: some View {
        VStack(spacing: 16.0) {
            TopView(user: user)
            Text(user.text)
            .lineLimit(nil)
        }.padding()
        
    }
}

#if DEBUG
struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(user: userResponse[0])
    }
}
#endif
