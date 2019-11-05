//
//  FetchError.swift
//  SwiftUI-ListFetching
//
//  Created by Mykhailo Bondarenko on 04.11.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation

enum FetchError: Error {
    case error(String)
    
    var localizedDescription: String {
        switch self {
        case .error(let message):
            return message
        }
    }
}
