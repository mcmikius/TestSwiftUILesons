//
//  ProductRow.swift
//  SwiftBookAppLessons
//
//  Created by Mykhailo Bondarenko on 8/15/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    
    var categoryName: String
    var items: [ProductsResponse]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Text(self.categoryName).font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            ScrollView {
                HStack(alignment: .center, spacing: 0) {
                    ForEach(self.items.identified(by: \.name)) { object in
                        CategoryItemView(object: object)
                    }
                }
            }.frame(height: 190)
        }
    }
}

#if DEBUG
struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(categoryName: materialResponse[0].category.rawValue, items: Array(materialResponse.prefix(3)))
    }
}
#endif
