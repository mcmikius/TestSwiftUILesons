//
//  Models.swift
//  UnsplashClient
//
//  Created by Mykhailo Bondarenko on 30.10.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation
import SwiftUI

struct Model: Identifiable {
    let id: String
    let name: String
    let bio: String
    let image: UIImage
    
    init(user: User) {
        self.id = user.id
        self.name = user.name
        self.bio = user.bio ?? "No bio"
        if let url = URL(string: user.profileImage.medium) {
            let data = try! Data(contentsOf: url)
            self.image = UIImage(data: data) ?? UIImage(imageLiteralResourceName: "Image")
        } else {
            self.image = UIImage(imageLiteralResourceName: "Image")
        }
    }
}
