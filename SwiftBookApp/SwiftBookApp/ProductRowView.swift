//
//  ProductRowView.swift
//  SwiftBookApp
//
//  Created by Mykhailo Bondarenko on 18.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct ProductRowView: View {
    var categoryName: String
    var items: [ProductsResponse]
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Text(self.categoryName).font(.headline).padding(.leading, 15).padding(.top, 5)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center){
                    ForEach(self.items) { item in
                        NavigationLink(destination: DetailScreenView()) {
                            ProductItem(object: item)
                        }
                    }
                }
            }.frame(height: 190)
        }
    }
}

struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowView(categoryName: materialResponse[0].category.rawValue, items: Array(materialResponse.prefix(3)))
    }
}
