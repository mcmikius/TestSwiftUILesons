//
//  AppView.swift
//  iDine
//
//  Created by Mykhailo Bondarenko on 13.11.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            ContentView().tabItem {
                Image(systemName: "list.dash")
                Text("Menu")
            }
            OrderView().tabItem {
                Image(systemName: "square.and.pencil")
                Text("Order")
            }
            FavoritesView().tabItem {
                Image(systemName: "star")
                Text("Favorites")
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let order = Order()
    static let favorites = Favorites()
    static var previews: some View {
        AppView().environmentObject(order).environmentObject(favorites)
    }
}
