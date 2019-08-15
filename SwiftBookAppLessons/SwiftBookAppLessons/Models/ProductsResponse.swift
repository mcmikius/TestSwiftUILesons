//
//  ProductsResponse.swift
//  SwiftBookAppLessons
//
//  Created by Mykhailo Bondarenko on 8/15/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation
import SwiftUI

enum Category: String, CaseIterable, Codable, Hashable {
    case courses = "Courses"
    case webinars = "Webinars"
}

struct ProductsResponse: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var image: String
    var shortName: String
    var category: Category
    var description: String
    var rating: Double
    var students: Int
    var lessons: Int
    var isFavorite: Bool
    var isFeatured: Bool
}
