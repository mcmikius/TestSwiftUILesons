//
//  ItemRowView.swift
//  iDine
//
//  Created by Mykhailo Bondarenko on 13.11.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct ItemRowView: View {
    static let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    var item: MenuItem
    
    var body: some View {
        
        NavigationLink(destination: ItemDetailView(item: item)) {
            HStack {
                Image(item.thumbnailImage).clipShape(Circle()).overlay(Circle().stroke(Color.gray, lineWidth: 2))
                
                VStack(alignment: .leading) {
                    Text(item.name).font(.headline)
                    Text("$\(item.price)")
                }.layoutPriority(1)
                Spacer()
                ForEach(item.restrictions, id: \.self) { restriction in
                    Text(restriction).font(.caption).fontWeight(.black).padding(5).background(Self.colors[restriction, default: .black]).clipShape(Circle()).foregroundColor(.white)
                }
            }
        }
    }
}

struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowView(item: MenuItem.example)
    }
}
