//
//  ChannelModel.swift
//  SwiftUIWebinar
//
//  Created by Mykhailo Bondarenko on 19.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation
import Combine

final class ChannelModel: ObservableObject {
    @Published var channelName: String = "Swiftbook.ru"
}
