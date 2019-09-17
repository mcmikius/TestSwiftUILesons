//
//  ContentView.swift
//  SwiftBookApp
//
//  Created by Mykhailo Bondarenko on 17.09.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct CategoryHomeView: View {
    
    var categories: [String: [ProductsResponse]] {
        .init(grouping: materialResponse, by: { $0.category.rawValue})
    }
    
    var body: some View {
        NavigationView {
            List {
                CellView(user: swiftbook).listRowInsets(EdgeInsets())
                
                ForEach(self.categories.keys.sorted(), id: \.self) { key in
                    CategoryRowView(categoryName: key, items: self.categories[key]!)
//                    if key == "Courses" {
//                        CourseRowView(categoryName: key, items: self.categories[key]!)
//                    } else if key == "Webinars" {
//                        WebinarRowView(categoryName: key, items: self.categories[key]!)
//                    }
                }.listRowInsets(EdgeInsets())
                NavigationLink(destination: FriendsListView()) {
                    Text("Teachers")
                }
            }
            .navigationBarTitle(Text("Homepage"))
        }
    }
}

struct CategoryHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHomeView()
    }
}
