//
//  WebinarRowView.swift
//  SwiftBookAppLessons
//
//  Created by Mykhailo Bondarenko on 8/15/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct WebinarRowView: View {
    
    var categoryName: String
    var items: [ProductsResponse]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(showsHorizontalIndicator: false) {
                HStack(alignment: .center, spacing: 0) {
                    ForEach(self.items.identified(by: \.name)) { object in
                            WebinarItem(object: object)
                    }
                }
            }
            .frame(height: 210)
        }
    }
}

#if DEBUG
struct WebinarRowView_Previews: PreviewProvider {
    static var previews: some View {
        WebinarRowView(categoryName: "Webinars", items: Array(materialResponse.dropFirst(4)))
    }
}
#endif
