//
//  ProductItem.swift
//  SwiftBookApp
//
//  Created by Mykhailo Bondarenko on 17.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct CategoryItem: View {
    
    var object: ProductsResponse
    
    var body: some View {
        VStack(alignment: .leading) { Image(object.image).resizable().cornerRadius(10).frame(width: 170, height: 170)
        }.padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(object: materialResponse[0])
    }
}
