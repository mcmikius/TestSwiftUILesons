//
//  UserData.swift
//  Landmarks
//
//  Created by Mykhailo Bondarenko on 30.08.2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import Combine
import SwiftUI


final class UserData: ObservableObject  {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
