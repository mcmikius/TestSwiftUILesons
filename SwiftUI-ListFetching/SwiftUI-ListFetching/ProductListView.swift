//
//  ProductListView.swift
//  SwiftUI-ListFetching
//
//  Created by Mykhailo Bondarenko on 04.11.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import Foundation
import SwiftUI

struct ProductListView : View {
    @ObservedObject var productFetcher = ProductFetcher()
    
    private var stateContent: AnyView {
        switch productFetcher.state {
        case .loading:
            return AnyView(
                ActivityIndicator(style: .medium)
            )
        case .fetched(let result):
            switch result {
            case .failure(let error):
                return AnyView(
                    Text(error.localizedDescription)
                )
            case .success(let root):
                return AnyView(
                    List(root.products) { product in
                        NavigationLink(destination: ProductDetailsView(product: product)) {
                            ProductRow(product: product)
                        }
                    }
                )
            }
        }
    }
    
    var body: some View {
        NavigationView {
            stateContent
            .navigationBarTitle(Text("Products"))
        }
    }
}
