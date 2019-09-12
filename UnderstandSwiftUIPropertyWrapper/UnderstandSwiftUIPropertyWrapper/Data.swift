//
//  Data.swift
//  UnderstandSwiftUIPropertyWrapper
//
//  Created by Mykhailo Bondarenko on 11.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

let itemData = [RandomItem(name: "item 1", favorite: true), RandomItem(name: "item 2", favorite: false), RandomItem(name: "item 3", favorite: false), RandomItem(name: "item 4", favorite: true), RandomItem(name: "item 5", favorite: true), RandomItem(name: "item 6", favorite: true), RandomItem(name: "item 7", favorite: false)]

struct RandomItem: Identifiable {
    let id: UUID
    let name: String
    let favorite: Bool
    
    init(name: String, favorite: Bool) {
        self.id = UUID()
        self.name = name
        self.favorite = favorite
    }
}
