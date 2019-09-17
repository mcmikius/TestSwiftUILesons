//
//  ProductRowView.swift
//  SwiftBookApp
//
//  Created by Mykhailo Bondarenko on 17.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct CourseRowView: View {
    var categoryName: String
    var items: [ProductsResponse]
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Text(self.categoryName).font(.headline).padding(.leading, 15).padding(.top, 5)
            ScrollView{
                HStack(alignment: .center){
                    ForEach(self.items) { item in
                        CourseItem(object: item)
                    }
                }
            }.frame(height: 190)
        }
    }
}

struct CourseRowView_Previews: PreviewProvider {
    static var previews: some View {
        CourseRowView(categoryName: materialResponse[0].category.rawValue, items: Array(materialResponse.prefix(3)))
    }
}
