//
//  WebinarItem.swift
//  SwiftBookApp
//
//  Created by Mykhailo Bondarenko on 17.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct WebinarItem: View {
    
    var object: ProductsResponse
    
    var body: some View {
        VStack(alignment: .leading) { Image(object.image).resizable().renderingMode(.original).cornerRadius(10).frame(width: 170, height: 190)
        }.padding(.leading, 15)
    }
}

struct WebinarItem_Previews: PreviewProvider {
    static var previews: some View {
        WebinarItem(object: materialResponse[4])
    }
}
