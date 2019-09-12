//
//  UserDefault.swift
//  UnderstandSwiftUIPropertyWrapper
//
//  Created by Mykhailo Bondarenko on 12.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation

struct UserDefault<T> {
    let key: String
    let defaultValue: T
    
    var value: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
    
    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
}
