//
//  ProductItemView.swift
//  SwiftBookAppLessons
//
//  Created by Mykhailo Bondarenko on 8/15/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct ProductItemView: View {
    
    var object: ProductsResponse
    
    var body: some View {
        VStack{
            Image(object.image)
            .resizable()
            .cornerRadius(10)
                .frame(width:170, height: 170)
        }.padding(.leading, 15)
    }
}

#if DEBUG
struct ProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        ProductItemView(object: materialResponse[1])
    }
}
#endif
