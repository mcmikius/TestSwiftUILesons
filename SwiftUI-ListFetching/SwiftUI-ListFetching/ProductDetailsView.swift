//
//  ProductDetailsView.swift
//  SwiftUI-ListFetching
//
//  Created by Mykhailo Bondarenko on 04.11.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation
import SwiftUI

struct ProductDetailsView : View {
    var product: Product
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                ProductRow(product: product)
                Text("Variants").font(.title).padding()
                List(product.variants) { variant in
                    VStack(alignment: .leading) {
                        Text(variant.title)
                        Text(variant.price)
                    }
                }
            }
            .navigationBarTitle(Text("Details"))
        }
        
    }
}
