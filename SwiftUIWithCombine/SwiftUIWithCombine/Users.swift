//
//  Users.swift
//  SwiftUIWithCombine
//
//  Created by Mykhailo Bondarenko on 05.11.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation

struct Users: Codable {
    let results : [User]?

    enum CodingKeys: String, CodingKey {

        case results = "results"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try values.decodeIfPresent([User].self, forKey: .results)
    }

}
