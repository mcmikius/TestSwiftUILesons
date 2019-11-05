//
//  Variant.swift
//  SwiftUI-ListFetching
//
//  Created by Mykhailo Bondarenko on 04.11.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation

struct Variant: Decodable, Identifiable {
    var id: Int
    
    let title, price: String
}
