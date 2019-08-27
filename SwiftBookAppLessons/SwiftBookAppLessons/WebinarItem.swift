//
//  WebinarItem.swift
//  SwiftBookAppLessons
//
//  Created by Mykhailo Bondarenko on 8/15/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct WebinarItem: View {
    
    var object: ProductsResponse
    
    var body: some View {
        FeaturedLandmarks(object: object)
                
        .listRowInsets(EdgeInsets())
    }
}

struct FeaturedLandmarks: View {
    
    var object: ProductsResponse
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Image(object.image)
                .resizable()
                .renderingMode(.original)
                .cornerRadius(10)
                .frame(width: 170, height: 190)
        }.padding(.leading, 15)
    }
}

#if DEBUG
struct WebinarItem_Previews: PreviewProvider {
    static var previews: some View {
        WebinarItem(object: materialResponse[4])
    }
}
#endif
