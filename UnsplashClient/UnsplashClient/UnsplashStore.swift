//
//  UnsplashStore.swift
//  UnsplashClient
//
//  Created by Mykhailo Bondarenko on 30.10.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class UnsplashStore: ObservableObject {
    static let url = URL(string: "https://api.unsplash.com/photos?client_id=d30dd0af646aedfa6e85f6ace11282e8b2086a582d456a3608459e411865fe32")!
    @Published var models: [Model] = []
    
//    var objectWillChange = PassthroughSubject<Void, Never>()
    func fetch() {
        URLSession.shared.dataTask(with: UnsplashStore.url) { (data, response, error) in
            guard let data = data, error == nil else {
                return
                
            }
            guard let models = try? Unsplash(data: data) else {
                return
            }
            let viewModels = models.map { $0.user }.compactMap(Model.init)
            DispatchQueue.main.async {
                self.models = viewModels
            }
        }.resume()
    }
}
