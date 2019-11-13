//
//  FavoritesView.swift
//  iDine
//
//  Created by Mykhailo Bondarenko on 13.11.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favorites: Favorites
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(favorites.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }.onDelete(perform: deleteItems(at:))
                }
            }.navigationBarTitle("Favorites").listStyle(DefaultListStyle()).navigationBarItems(trailing: EditButton())
        }
    }
    func deleteItems(at offsets: IndexSet) {
        favorites.items.remove(atOffsets: offsets)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static let favorites = Favorites()
    static var previews: some View {
        FavoritesView().environmentObject(favorites)
    }
}
