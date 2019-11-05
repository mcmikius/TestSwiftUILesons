//
//  User.swift
//  SwiftUIWithCombine
//
//  Created by Mykhailo Bondarenko on 05.11.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation

public struct User: Identifiable {
    public var id = UUID()
    let name: String
    let email: String
    let phoneNum: String
    let imageUrl: String
}
