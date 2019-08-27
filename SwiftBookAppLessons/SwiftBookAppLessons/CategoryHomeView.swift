//
//  ContentView.swift
//  SwiftBookAppLessons
//
//  Created by Mykhailo Bondarenko on 8/15/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct CategoryHomeView: View {
    var categories: [String: [ProductsResponse]] {
        .init(grouping: materialResponse, by: {$0.category.rawValue}
        )
    }
    
    var body: some View {
        NavigationView {
            List {
                CellView(user: swiftbook).listRowInsets(EdgeInsets())
                ForEach(
                ForEach(self.categories.keys.sorted(), id: \.self) { key in
                    if key == "Courses" {
                        CategoryRow(categoryName: key, items: self.categories[key]!)
                    } else if key == "Webinars" {
                        WebinarRowView(categoryName: key, items: self.categories[key]!)
                        }
                }.listRowInsets(EdgeInsets())
                NavigationLink(destination: FriendsListView()) {
                    Text("Our teachings")
                }
            }
        .navigationBarTitle(Text("Homepage"))
        }
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
