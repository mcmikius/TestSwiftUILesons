//
//  ProductRow.swift
//  SwiftUI-ListFetching
//
//  Created by Mykhailo Bondarenko on 04.11.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation
import SwiftUI

struct ProductRow: View {
    var product: Product
    
    var body: some View {
        HStack {
            LoadableImageView(with: product.image.src).frame(width: 60, height: 60)
            VStack(alignment: .leading) {
                Text(product.title)
                Text(product.body_html).font(.caption)
            }
        }
    }
}
