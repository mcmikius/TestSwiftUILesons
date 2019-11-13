//
//  User.swift
//  SwiftUIWithCombine
//
//  Created by Mykhailo Bondarenko on 05.11.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation

public struct User: Codable , Identifiable {
    let name : Name
    let email : String
    let phone : String
    let cell : String
    public var id = UUID()
    let picture : Picture
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case email = "email"
        case phone = "phone"
        case cell = "cell"
        case picture = "picture"
    }
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(Name.self, forKey: .name)!
        email = try values.decodeIfPresent(String.self, forKey: .email)!
        phone = try values.decodeIfPresent(String.self, forKey: .phone)!
        cell = try values.decodeIfPresent(String.self, forKey: .cell)!
        picture = try values.decodeIfPresent(Picture.self, forKey: .picture)!
    }
}
