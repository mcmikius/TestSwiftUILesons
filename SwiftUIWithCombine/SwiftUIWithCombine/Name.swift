//
//  Name.swift
//  SwiftUIWithCombine
//
//  Created by Mykhailo Bondarenko on 05.11.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation
public struct Name: Codable {
    let title : String
    let first : String
    let last : String

    enum CodingKeys: String, CodingKey {

        case title = "title"
        case first = "first"
        case last = "last"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)!
        first = try values.decodeIfPresent(String.self, forKey: .first)!
        last = try values.decodeIfPresent(String.self, forKey: .last)!
    }

}
