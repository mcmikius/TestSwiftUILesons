//
//  ProductItem.swift
//  SwiftBookApp
//
//  Created by Mykhailo Bondarenko on 18.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct ProductItem: View {
    var object: ProductsResponse
    
    var body: some View {
        VStack(alignment: .leading) { Image(object.image).resizable().cornerRadius(10).frame(width: 170, height: 170)
        }.padding(.leading, 15)
    }
}

struct ProductItem_Previews: PreviewProvider {
    static var previews: some View {
        ProductItem(object: materialResponse[0])
    }
}
