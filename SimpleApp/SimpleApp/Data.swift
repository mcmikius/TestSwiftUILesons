//
//  Data.swift
//  SimpleApp
//
//  Created by Mykhailo Bondarenko on 11.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation
import SwiftUI

let developers = [Developer(id: 1001, codeName: "one"), Developer(id: 1002, codeName: "two"), Developer(id: 1003, codeName: "three"), Developer(id: 1004, codeName: "four")]

struct Developer: Identifiable {
    var id: Int
    var codeName: String
}
