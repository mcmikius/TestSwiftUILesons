//
//  ContentView.swift
//  SwiftBookAppLessons
//
//  Created by Mykhailo Bondarenko on 8/15/19.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var categories: [String: [ProductsResponse]] {
        .init(grouping: materialResponse, by: {$0.category.rawValue}
        )
    }
    
    var body: some View {
        NavigationView {
            List {
                CellView(user: swiftbook).listRowInsets(EdgeInsets())
                ForEach(self.categories.keys.sorted(), id: \.self) { key in
                ProductRow(categoryName: key, items: self.categories[key]!)
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
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
