//
//  DataStore.swift
//  UnderstandSwiftUIPropertyWrapper
//
//  Created by Mykhailo Bondarenko on 12.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI
import Combine

final class DataStore: ObservedObject {
    
    let didChange = PassthroughSubject<DataStore, Never>()
    @UserDefault(key: "firstLaunch", defaultValue: true)
    var firstLaunch: Bool {
        didSet {
            didChange.send(self)
        }
    }
}
