//
//  ProductItem.swift
//  SwiftBookApp
//
//  Created by Mykhailo Bondarenko on 17.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct CourseItem: View {
    var object: ProductsResponse
    var body: some View {
        VStack { Image(object.image).resizable().cornerRadius(10).frame(width: 170, height: 170)
        }.padding(.leading, 15)
    }
}

struct CourseItem_Previews: PreviewProvider {
    static var previews: some View {
        CourseItem(object: materialResponse[1])
    }
}
