//
//  Product.swift
//  SwiftUI-ListFetching
//
//  Created by Mykhailo Bondarenko on 04.11.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation

struct Product: Decodable, Identifiable {
    var id: Int
    
    let title, body_html, vendor: String
    let variants: [Variant]
    let image: ProductImage
}
