//
//  VideoIdea.swift
//  VCShow
//
//  Created by Mykhailo Bondarenko on 13.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Combine

final class VideoIdea: ObservableObject {
    @Published var title: String = ""
    @Published var contentIdea: String = ""
}
