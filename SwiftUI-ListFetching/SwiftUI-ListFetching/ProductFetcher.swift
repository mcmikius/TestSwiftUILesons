//
//  ProductFetcher.swift
//  SwiftUI-ListFetching
//
//  Created by Mykhailo Bondarenko on 04.11.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation
import Combine

class ProductFetcher: ObservableObject {
    private static let apiUrlString = "https://gist.githubusercontent.com/schmidyy/02fdec9b9e05a71312a550fc50f948e6/raw/7fc2facbbf9c3aa526f35a32d0c7fe74a4fc29a1/products.json"
    var objectWillChange = PassthroughSubject<ProductFetcher, Never>()
    
    var state: LoadableState<Root> = .loading {
        willSet {
            objectWillChange.send(self)
        }
    }
    
    init() {
        guard let apiUrl = URL(string: ProductFetcher.apiUrlString) else {
            state = .fetched(.failure(.error("Malformed API URL.")))
            return
        }
        
        URLSession.shared.dataTask(with: apiUrl) { [weak self] (data, _, error) in
            if let error = error {
                self?.state = .fetched(.failure(.error(error.localizedDescription)))
                return
            }
            
            guard let data = data else {
                self?.state = .fetched(.failure(.error("Malformed response data")))
                return
            }
            let root = try! JSONDecoder().decode(Root.self, from: data)
            
            DispatchQueue.main.async { [weak self] in
                self?.state = .fetched(.success(root))
            }
        }.resume()
    }
}
